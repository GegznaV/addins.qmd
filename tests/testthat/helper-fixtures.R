fixture_context <- function(id = "doc-id", start_row = NULL, end_row = NULL, contents = NULL) {
  ctx <- list(id = id)

  if (!is.null(start_row)) {
    if (is.null(end_row)) {
      end_row <- start_row
    }

    ctx$selection <- list(
      list(range = list(start = c(row = start_row), end = c(row = end_row)))
    )
  }

  if (!is.null(contents)) {
    ctx$contents <- contents
  }

  ctx
}

fixture_selected_rows <- function(lines, row_numbers) {
  x <- as.character(lines)
  attr(x, "row_numbers") <- as.integer(row_numbers)
  x
}
