test_that("qmd_heading_remove routes by style", {
  ctx <- list(id = "doc-id")
  events <- character()

  local_mocked_bindings(
    is_visual_editor = function() FALSE,
    rs_get_index_first_selected_row = function(context) 3,
    is_underline_style_heading = function(row, context) TRUE,
    rm_underline_style_heading = function(row, context, detected) {
      events <<- c(events, paste0("u:", row, ":", detected))
      invisible(NULL)
    },
    rm_hash_style_heading = function(row, context) {
      events <<- c(events, paste0("h:", row))
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  qmd_heading_remove(style = "underline", context = ctx)
  qmd_heading_remove(style = "hash", context = ctx)
  qmd_heading_remove(style = "both", context = ctx)

  expect_identical(events, c("u:3:TRUE", "h:3", "u:3:TRUE", "h:3"))
})

test_that("qmd_heading_remove auto branch uses detected style", {
  ctx <- list(id = "doc-id")
  events <- character()

  local_mocked_bindings(
    is_visual_editor = function() FALSE,
    rs_get_index_first_selected_row = function(context) 2,
    rm_underline_style_heading = function(row, context, detected) {
      events <<- c(events, "underline")
      invisible(NULL)
    },
    rm_hash_style_heading = function(row, context) {
      events <<- c(events, "hash")
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  local_mocked_bindings(
    is_underline_style_heading = function(row, context) TRUE,
    .package = "addins.qmd"
  )
  qmd_heading_remove(style = "auto", context = ctx)

  local_mocked_bindings(
    is_underline_style_heading = function(row, context) FALSE,
    .package = "addins.qmd"
  )
  qmd_heading_remove(style = "auto", context = ctx)

  expect_identical(events, c("underline", "hash"))
})

test_that("add_underline_style_heading in source mode computes underline length", {
  ctx <- list(id = "doc-id")
  recorded <- list()

  local_mocked_bindings(
    is_visual_editor = function() FALSE,
    rs_get_first_selected_row = function(context) "Hello",
    repeat_symbol = function(symbol, n) strrep(symbol, n),
    qmd_heading_remove = function(style, context) {
      recorded$style <<- style
      invisible(NULL)
    },
    rs_enclose_first_row_with = function(...) {
      recorded$args <<- list(...)
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  addins.qmd:::add_underline_style_heading("=", context = ctx)

  expect_identical(recorded$style, "underline")
  expect_identical(recorded$args$text_below, "======")
  expect_true(isTRUE(recorded$args$ensure_blank_above))
})

test_that("add_underline_style_heading warns in visual editor mode", {
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

  expect_null(addins.qmd:::add_underline_style_heading("="))
  expect_true(grepl("does not work in Visual Editor", warning_call))
})

test_that("qmd_heading_level_change handles upper/lower bounds", {
  symbols <- character()

  local_mocked_bindings(
    rs_get_first_selected_row = function(context) "###### Top",
    add_hash_style_heading = function(symbol, context) {
      symbols <<- c(symbols, symbol)
      invisible(NULL)
    },
    .package = "addins.qmd"
  )

  addins.qmd:::qmd_heading_level_change("down")

  local_mocked_bindings(
    rs_get_first_selected_row = function(context) "No heading",
    .package = "addins.qmd"
  )

  addins.qmd:::qmd_heading_level_change("up")

  expect_identical(symbols, c("###### ", ""))
})
