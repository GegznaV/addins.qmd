test_that("formatting wrappers call enclose helper with expected symbols", {
  ctx <- list(id = "doc-id")
  call <- NULL

  local_mocked_bindings(
    is_visual_editor = function() FALSE,
    rs_enclose_selection_with = function(...) {
      call <<- list(...)
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  cases <- list(
    qmd_format_bold = list(symbol = "**"),
    qmd_format_italics = list(symbol = "_"),
    qmd_format_bold2 = list(symbol = "__"),
    qmd_format_italics2 = list(symbol = "*"),
    qmd_code_inline = list(symbol = "`"),
    qmd_format_superscript = list(symbol = "^"),
    qmd_format_subscript = list(symbol = "~"),
    qmd_format_strikethrough = list(symbol = "~~"),
    qmd_equation_a_inline = list(symbol = "$"),
    qmd_equation_b_block = list(symbol = "$$")
  )

  for (fn in names(cases)) {
    call <- NULL
    get(fn, envir = asNamespace("addins.qmd"))(context = ctx)
    expect_identical(call$context, ctx)
    expect_identical(call$symbol, cases[[fn]]$symbol)
  }
})

test_that("formatting wrappers with asymmetric symbols use expected text", {
  ctx <- list(id = "doc-id")
  call <- NULL

  local_mocked_bindings(
    is_visual_editor = function() FALSE,
    rs_enclose_selection_with = function(...) {
      call <<- list(...)
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  get("qmd_format_bold_italics", envir = asNamespace("addins.qmd"))(context = ctx)
  expect_identical(call$symbol_before, "**_")
  expect_identical(call$symbol_after, "_**")

  get("qmd_format_html_comment", envir = asNamespace("addins.qmd"))(context = ctx)
  expect_identical(call$symbol_before, "<!--")
  expect_identical(call$symbol_after, "-->")

  get("qmd_code_inline_r", envir = asNamespace("addins.qmd"))(context = ctx)
  expect_identical(call$symbol_before, "`r ")
  expect_identical(call$symbol_after, "`")

  get("qmd_code_inline_highlighted_as_r", envir = asNamespace("addins.qmd"))(context = ctx)
  expect_identical(call$symbol_before, "`")
  expect_identical(call$symbol_after, "`{.r}")

  get("qmd_format_footnote", envir = asNamespace("addins.qmd"))(context = ctx)
  expect_identical(call$symbol_before, "^[")
  expect_identical(call$symbol_after, "]")

  get("qmd_link_url", envir = asNamespace("addins.qmd"))(context = ctx)
  expect_identical(call$symbol_before, "[")
  expect_identical(call$symbol_after, "](url_link)")

  get("qmd_insert_figure", envir = asNamespace("addins.qmd"))(context = ctx)
  expect_identical(call$symbol_before, "![")
  expect_identical(call$symbol_after, "](path_to_figure)")

  get("qmd_equation_b_block2", envir = asNamespace("addins.qmd"))(context = ctx)
  expect_identical(call$symbol_before, "\\[")
  expect_identical(call$symbol_after, "\\]")
})

test_that("visual editor command path is used for supported wrappers", {
  ctx <- list(id = "doc-id")
  commands <- character()
  used_fallback <- FALSE

  local_mocked_bindings(
    is_visual_editor = function() TRUE,
    run_visual_editor_command = function(command) {
      commands <<- c(commands, command)
      TRUE
    },
    rs_enclose_selection_with = function(...) {
      used_fallback <<- TRUE
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  qmd_format_bold(context = ctx)
  qmd_format_italics(context = ctx)
  qmd_format_bold2(context = ctx)
  qmd_format_italics2(context = ctx)
  qmd_format_bold_italics(context = ctx)
  qmd_code_inline(context = ctx)
  qmd_format_strikethrough(context = ctx)
  qmd_link_url(context = ctx)
  qmd_format_footnote(context = ctx)

  expect_identical(
    commands,
    c(
      "markdownBold",
      "markdownItalic",
      "markdownBold",
      "markdownItalic",
      "markdownBold",
      "markdownItalic",
      "markdownCode",
      "markdownStrikethrough",
      "markdownLink",
      "markdownFootnote"
    )
  )
  expect_false(used_fallback)
})

test_that("visual editor command path falls back when command is unavailable", {
  ctx <- list(id = "doc-id")
  call <- NULL

  local_mocked_bindings(
    is_visual_editor = function() TRUE,
    run_visual_editor_command = function(command) FALSE,
    rs_enclose_selection_with = function(...) {
      call <<- list(...)
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  qmd_format_bold(context = ctx)
  expect_identical(call$symbol, "**")
  expect_identical(call$context, ctx)

  call <- NULL
  qmd_format_footnote(context = ctx)
  expect_identical(call$symbol_before, "^[")
  expect_identical(call$symbol_after, "]")
  expect_identical(call$context, ctx)
})

test_that("horizontal rule wrapper delegates expected text", {
  ctx <- list(id = "doc-id")
  call <- NULL

  local_mocked_bindings(
    rs_enclose_selected_rows_with = function(...) {
      call <<- list(...)
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  qmd_horizontal_rule(context = ctx)

  expect_identical(call$text_below, "* * *")
  expect_identical(call$context, ctx)
})

test_that("figure code block addin sets cursor for empty selection", {
  ctx <- list(id = "doc-id")
  inserted <- NULL
  cursor <- NULL

  local_mocked_bindings(
    rs_enclose_selection_with = function(...) {
      inserted <<- list(...)
      invisible(NULL)
    },
    rs_get_selection_text = function(context) "",
    rs_get_index_first_selected_row = function(context) 5,
    .package = "addins.qmd"
  )

  local_mocked_bindings(
    document_position = function(row, column) list(row = row, column = column),
    setCursorPosition = function(position, id) {
      cursor <<- list(position = position, id = id)
      invisible(NULL)
    },
    .package = "rstudioapi"
  )

  qmd_insert_figure_r_code_block(context = ctx)

  expect_true(grepl("^```\\{r fig-ID-", inserted$symbol_before))
  expect_true(grepl("knitr::include_graphics\\(\"$", inserted$symbol_before))
  expect_true(grepl("CAPTION = \"\"", inserted$symbol_after, fixed = TRUE))
  expect_true(isTRUE(inserted$trim))
  expect_identical(inserted$context, ctx)

  expect_identical(cursor$id, "doc-id")
  expect_identical(cursor$position$row, 6)
  expect_identical(cursor$position$column, 26)
})

test_that("figure code block addin sets cursor for non-empty selection", {
  ctx <- list(id = "doc-id")
  cursor <- NULL

  local_mocked_bindings(
    rs_enclose_selection_with = function(...) invisible(NULL),
    rs_get_selection_text = function(context) "img/path.png",
    rs_get_index_first_selected_row = function(context) 5,
    .package = "addins.qmd"
  )

  local_mocked_bindings(
    document_position = function(row, column) list(row = row, column = column),
    setCursorPosition = function(position, id) {
      cursor <<- list(position = position, id = id)
      invisible(NULL)
    },
    .package = "rstudioapi"
  )

  qmd_insert_figure_r_code_block(context = ctx)

  expect_identical(cursor$id, "doc-id")
  expect_identical(cursor$position$row, 8)
  expect_identical(cursor$position$column, 12)
})
