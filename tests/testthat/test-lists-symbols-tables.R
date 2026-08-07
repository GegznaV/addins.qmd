test_that("symbol helpers insert escaped symbols with no spaces", {
  ctx <- fixture_context()
  calls <- list()

  local_mocked_bindings(
    rs_insert_text = function(...) {
      calls <<- c(calls, list(list(...)))
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  qmd_symbol_asterisk(context = ctx)
  qmd_symbol_backslash(context = ctx)
  qmd_symbol_underscore(context = ctx)
  qmd_symbol_dollar(context = ctx)
  qmd_symbol_en_dash(context = ctx)
  qmd_symbol_em_dash(context = ctx)

  expected <- c("\\*", "\\\\", "\\_", "\\$", "--", "---")
  expect_identical(vapply(calls, function(x) x$text, character(1)), expected)
  expect_true(all(vapply(calls, function(x) identical(x$context, ctx), logical(1))))
  expect_true(all(vapply(calls, function(x) identical(x$spaces, FALSE), logical(1))))
})

test_that("qmd_list uses ordered-list command in visual editor mode", {
  warning_call <- FALSE

  local_mocked_bindings(
    is_visual_editor = function() TRUE,
    run_rs_command = function(command) {
      expect_identical(command, "markdownOrderedList")
      TRUE
    },
    .package = "addins.qmd"
  )

  local_mocked_bindings(
    sendToConsole = function(code, execute, focus) {
      warning_call <<- TRUE
      invisible(NULL)
    },
    .package = "rstudioapi"
  )

  expect_null(qmd_list(type = "numbered", level = 1, context = list()))
  expect_false(warning_call)
})

test_that("qmd_list warns when visual editor command is unavailable", {
  warning_call <- NULL

  local_mocked_bindings(
    is_visual_editor = function() TRUE,
    run_rs_command = function(command) FALSE,
    .package = "addins.qmd"
  )

  local_mocked_bindings(
    sendToConsole = function(code, execute, focus) {
      warning_call <<- code
      invisible(NULL)
    },
    .package = "rstudioapi"
  )

  expect_null(qmd_list(type = "numbered", level = 1, context = list()))
  expect_true(grepl("do not work in", warning_call))
})

test_that("qmd_list prefixes selected rows and inserts optional blank line", {
  context <- fixture_context(start_row = 2, end_row = 4)

  inserts <- list()

  local_mocked_bindings(
    is_visual_editor = function() FALSE,
    is_blank_line_needed_above = function(context) TRUE,
    rs_insert_at_row_start = function(row, text, id) {
      inserts <<- c(inserts, list(list(row = row, text = text, id = id)))
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  qmd_list(type = "numbered", level = 1, context = context)

  expect_identical(inserts[[1]]$text, "1. ")
  expect_identical(inserts[[2]]$text, "2. ")
  expect_identical(inserts[[3]]$text, "3. ")
  expect_identical(inserts[[4]]$text, "\n")
  expect_equal(inserts[[4]]$row, 2)
  expect_true(all(vapply(inserts, function(x) identical(x$id, "doc-id"), logical(1))))
})

test_that("qmd_list rejects unknown type", {
  context <- fixture_context(start_row = 1)

  local_mocked_bindings(
    is_visual_editor = function() FALSE,
    .package = "addins.qmd"
  )

  expect_error(qmd_list(type = "not-a-type", context = context), "Unrecognized symol")
})

test_that("list convenience wrappers delegate expected type/level", {
  calls <- list()

  local_mocked_bindings(
    qmd_list = function(type = "unordered", level = 1, context = rs_get_context()) {
      calls <<- c(calls, list(list(type = type, level = level)))
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  qmd_block_quotes()
  qmd_line_blocks()
  qmd_list_unordered()
  qmd_list_unordered_2()
  qmd_list_numbered()
  qmd_list_numbered_2()
  qmd_list_lettered()
  qmd_list_lettered_2()
  qmd_list_z_example_list()

  expect_identical(calls[[1]], list(type = ">", level = 1))
  expect_identical(calls[[2]], list(type = "|", level = 1))
  expect_identical(calls[[3]], list(type = "-", level = 1))
  expect_identical(calls[[4]], list(type = "+", level = 2))
  expect_identical(calls[[5]], list(type = "numbered", level = 1))
  expect_identical(calls[[6]], list(type = "numbered", level = 2))
  expect_identical(calls[[7]], list(type = "lettered", level = 1))
  expect_identical(calls[[8]], list(type = "lettered", level = 2))
  expect_identical(calls[[9]], list(type = "(@)", level = 1))
})

test_that("qmd_remove_list strips list markup and updates selected range", {
  context <- fixture_context()
  modified <- NULL
  selected <- FALSE

  local_mocked_bindings(
    rs_get_selected_rows = function(context) {
      fixture_selected_rows(c("- item one", "2. item two"), c(3, 4))
    },
    rs_select_all_selected_rows = function(context) {
      selected <<- TRUE
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  local_mocked_bindings(
    document_range = function(start, end) list(start = start, end = end),
    modifyRange = function(location, text, id) {
      modified <<- list(location = location, text = text, id = id)
      invisible(NULL)
    },
    .package = "rstudioapi"
  )

  qmd_remove_list(context = context)

  expect_identical(modified$id, "doc-id")
  expect_identical(modified$text, "item one\nitem two")
  expect_true(selected)
})

test_that("qmd_remove_list strips stacked list markers in one pass", {
  context <- fixture_context()
  modified <- NULL

  local_mocked_bindings(
    rs_get_selected_rows = function(context) {
      fixture_selected_rows(c("- 1. item one", "- 2.", "> 3) item three"), c(8, 10))
    },
    rs_select_all_selected_rows = function(context) invisible(NULL),
    .package = "addins.qmd"
  )

  local_mocked_bindings(
    document_range = function(start, end) list(start = start, end = end),
    modifyRange = function(location, text, id) {
      modified <<- list(location = location, text = text, id = id)
      invisible(NULL)
    },
    .package = "rstudioapi"
  )

  qmd_remove_list(context = context)

  expect_identical(modified$id, "doc-id")
  expect_identical(modified$text, "item one\n\nitem three")
})

test_that("qmd_remove_list keeps selection when no replacement is needed", {
  context <- fixture_context()
  modified <- FALSE
  selected <- FALSE

  local_mocked_bindings(
    rs_get_selected_rows = function(context) {
      fixture_selected_rows(c("plain one", "plain two"), c(1, 2))
    },
    rs_select_all_selected_rows = function(context) {
      selected <<- TRUE
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  local_mocked_bindings(
    modifyRange = function(location, text, id) {
      modified <<- TRUE
      invisible(NULL)
    },
    document_range = function(start, end) list(start = start, end = end),
    .package = "rstudioapi"
  )

  qmd_remove_list(context = context)

  expect_false(modified)
  expect_true(selected)
})

test_that("table style wrappers delegate expected template text", {
  ctx <- fixture_context()
  inserted <- NULL

  local_mocked_bindings(
    rs_enclose_first_row_with = function(...) {
      inserted <<- list(...)
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  addins.qmd:::qmd_table_style_simple(context = ctx)
  expect_identical(inserted$text_above, addins.qmd:::tbl_simple)
  expect_identical(inserted$context, ctx)

  addins.qmd:::qmd_table_style_md(context = ctx)
  expect_identical(inserted$text_above, addins.qmd:::tbl_md)

  addins.qmd:::qmd_table_style_md_alternative(context = ctx)
  expect_identical(inserted$text_above, addins.qmd:::tbl_md_alternative)

  addins.qmd:::qmd_table_style_multiline(context = ctx)
  expect_identical(inserted$text_above, addins.qmd:::tbl_multiline)

  addins.qmd:::qmd_table_style_multiline_no_colnames(context = ctx)
  expect_identical(inserted$text_above, addins.qmd:::tbl_multiline_no_colnames)

  addins.qmd:::qmd_table_style_grid(context = ctx)
  expect_identical(inserted$text_above, addins.qmd:::tbl_grid)
})
