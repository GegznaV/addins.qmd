test_that("code block wrappers in source mode delegate expected fences", {
  ctx <- fixture_context()
  call <- NULL

  local_mocked_bindings(
    is_visual_editor = function() FALSE,
    rs_enclose_selected_rows_with = function(...) {
      call <<- list(...)
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  qmd_code_block_r(context = ctx)
  expect_identical(call$text_above, "```{r}")
  expect_identical(call$text_below, "```")

  qmd_code_block_python(context = ctx)
  expect_identical(call$text_above, "```{python}")
  expect_identical(call$text_below, "```")

  qmd_code_block_sql(context = ctx)
  expect_identical(call$text_above, "```{sql}")
  expect_identical(call$text_below, "```")

  qmd_code_block(context = ctx)
  expect_identical(call$text_above, "```")
  expect_identical(call$text_below, "```")

  qmd_code_block_r_split(context = ctx)
  expect_identical(call$text_above, "```\n\n```{r}")
})

test_that("code block wrappers in visual editor mode call RStudio commands", {
  ctx <- fixture_context()
  commands <- character()
  set_text <- NULL

  local_mocked_bindings(
    is_visual_editor = function() TRUE,
    .package = "addins.qmd"
  )

  local_mocked_bindings(
    selectionGet = function(id) list(value = "a <- 1"),
    executeCommand = function(command, quiet = TRUE) {
      commands <<- c(commands, command)
      invisible(NULL)
    },
    selectionSet = function(value, id) {
      set_text <<- list(value = value, id = id)
      invisible(NULL)
    },
    .package = "rstudioapi"
  )

  qmd_code_block_r(context = ctx)
  qmd_code_block_python(context = ctx)
  qmd_code_block_sql(context = ctx)

  expect_identical(commands, c("insertChunkR", "insertChunkPython", "insertChunkSQL"))
  expect_identical(set_text$value, "a <- 1")
  expect_identical(set_text$id, "doc-id")
})

test_that("verbatim and split code block warn in visual editor mode", {
  ctx <- fixture_context()
  warnings <- character()

  local_mocked_bindings(
    is_visual_editor = function() TRUE,
    .package = "addins.qmd"
  )

  local_mocked_bindings(
    sendToConsole = function(code, execute, focus) {
      warnings <<- c(warnings, code)
      invisible(NULL)
    },
    .package = "rstudioapi"
  )

  qmd_code_block(context = ctx)
  qmd_code_block_r_split(context = ctx)

  expect_equal(length(warnings), 2)
  expect_true(any(grepl("qmd_code_block\\(\\)", warnings)))
  expect_true(any(grepl("qmd_code_block_r_split\\(\\)", warnings)))
})

test_that("heading wrappers route to hash and underline helpers", {
  ctx <- fixture_context()
  called <- list()

  local_mocked_bindings(
    is_visual_editor = function() FALSE,
    add_hash_style_heading = function(symbol, context) {
      called <<- c(called, list(list(type = "hash", symbol = symbol, context = context)))
      invisible(NULL)
    },
    add_underline_style_heading = function(symbol, context) {
      called <<- c(called, list(list(type = "underline", symbol = symbol, context = context)))
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  qmd_heading_1(context = ctx)
  qmd_heading_2(context = ctx)
  qmd_heading_6(context = ctx)
  qmd_heading_1_title(context = ctx)
  qmd_heading_2_subtitle(context = ctx)

  expect_identical(called[[1]]$symbol, "# ")
  expect_identical(called[[2]]$symbol, "## ")
  expect_identical(called[[3]]$symbol, "###### ")
  expect_identical(called[[4]]$symbol, "=")
  expect_identical(called[[5]]$symbol, "-")
  expect_true(all(vapply(called, function(x) identical(x$context, ctx), logical(1))))
})

test_that("heading wrappers use visual editor commands when available", {
  commands <- character()

  local_mocked_bindings(
    is_visual_editor = function() TRUE,
    run_visual_editor_command = function(command) {
      commands <<- c(commands, command)
      TRUE
    },
    add_hash_style_heading = function(symbol, context) {
      fail("source-mode heading helper should not be called in visual editor mode")
    },
    .package = "addins.qmd"
  )

  qmd_heading_1()
  qmd_heading_2()
  qmd_heading_3()
  qmd_heading_4()
  qmd_heading_5()
  qmd_heading_6()

  expect_identical(
    commands,
    c(
      "markdownHeader1",
      "markdownHeader2",
      "markdownHeader3",
      "markdownHeader4",
      "markdownHeader5",
      "markdownHeader6"
    )
  )
})

test_that("heading remove warns in visual editor mode", {
  ctx <- fixture_context()
  warning_call <- NULL

  local_mocked_bindings(
    is_visual_editor = function() TRUE,
    .package = "addins.qmd"
  )

  local_mocked_bindings(
    sendToConsole = function(code, execute, focus) {
      warning_call <<- code
      invisible(NULL)
    },
    .package = "rstudioapi"
  )

  expect_null(qmd_heading_remove(context = ctx))
  expect_true(grepl("does not work in Markdown Visual Editor", warning_call))
})

test_that("heading level change computes expected symbols", {
  ctx <- fixture_context()
  symbols <- character()

  local_mocked_bindings(
    rs_get_first_selected_row = function(context) "### Heading",
    add_hash_style_heading = function(symbol, context) {
      symbols <<- c(symbols, symbol)
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  addins.qmd:::qmd_heading_level_change("down", context = ctx)
  addins.qmd:::qmd_heading_level_change("up", context = ctx)

  expect_identical(symbols, c("#### ", "## "))
})

test_that("heading level wrappers delegate when not in visual editor", {
  ctx <- fixture_context()
  directions <- character()

  local_mocked_bindings(
    is_visual_editor = function() FALSE,
    qmd_heading_level_change = function(direction, context) {
      directions <<- c(directions, direction)
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  qmd_heading_level_up(context = ctx)
  qmd_heading_level_down(context = ctx)

  expect_identical(directions, c("up", "down"))
})

test_that("heading level wrappers return silently in visual editor", {
  ctx <- fixture_context()
  called <- FALSE

  local_mocked_bindings(
    is_visual_editor = function() TRUE,
    qmd_heading_level_change = function(direction, context) {
      called <<- TRUE
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  expect_null(qmd_heading_level_up(context = ctx))
  expect_null(qmd_heading_level_down(context = ctx))
  expect_false(called)
})

test_that("heading helper internals behave as expected", {
  expect_identical(addins.qmd:::rm_leading_hash("### Title"), "Title")
  expect_identical(addins.qmd:::rm_leading_hash("No hash"), "No hash")

  context <- fixture_context(contents = c("Title", "-----", "Body"))
  expect_true(addins.qmd:::is_underline_style_heading(1, context))
  expect_false(addins.qmd:::is_underline_style_heading(2, context))
})
