# TODO: rewrite the functions for Visual Markdown Editor mode.

# TODO: qmd_list() add:
# 1. Ability to skip empty lines;
# 2. Ability to continue numbering.

#' Format text as Quarto/Pandoc Markdown list.
#'
#' RStudio add-ins which format text as Quarto/Pandoc Markdown lists.
#' For the first-level lists: \itemize{
#'   \item `qmd_list()` - the main function, that make lists;
#'   \item `qmd_unordered_list()` - unordered list;
#'   \item `qmd_numbered_list()` - numbered list;
#'   \item `qmd_lettered_list()` - lettered list (non-capital English letters);
#'   \item `qmd_master_list()` - master list (which numbering continues throughout the document).
#'   }
#'
#' @param type (character) the type of list "unordered", "numbered", "lettered",  "LETTERED", "master", or list like elements "block quotes" and "line blocks".
#'
#' @param level (integer) the level of list.
#' @inheritParams addin.tools::rs_get_index
#'
#' @export
#' @family Quarto formatting add-ins

qmd_list <- function(type = "unordered", level = 1, context = rs_get_context()) {
  if (is_visual_editor()) {
    rstudioapi::sendToConsole(
      'warning(
        "List-related package `addins.qmd` addins do not work in ",
        "Markdown Visual Editor (VME) mode. \n",
        "Use related VME functionality instead."
      )',
      execute = TRUE,
      focus = FALSE
    )
    return()
  }

  sel <- context$selection[[1]]
  selected_rows <- sel$range$start["row"]:sel$range$end["row"]

  ind <- seq_along(selected_rows)

  # Indentation for list levels
  lev <- rep("    ", level - 1)
  # styler: off
  text <- switch(type,
    "1" = ,
    "ordered" = ,
    "numbered" = ,
    "numbers" = paste0(lev, ind, ". "),

    "a" = ,
    "lettered" = ,
    "letters" = paste0(lev, letters[ind], ". "),

    "A" = ,
    "LETTERED" = ,
    "LETTERS" = paste0(lev, LETTERS[ind], ". "),

    "+" = ,
    "unordered" = paste0(lev, rep("+", max(ind)), " "),

    "-" = paste0(lev, rep("-", max(ind)), " "),

    "*" = paste0(lev, rep("*", max(ind)), " "),

    "(@)" = ,
    "@" = ,
    "master" = ,
    "example list" = paste0(rep("(@)", max(ind)), " "),

    "block quotes" = ,
    ">" = paste0(rep(">", max(ind)), " "),

    "line blocks" = ,
    "|" = paste0(rep("|", max(ind)), " "),

    stop("Unrecognized symol.")
    # styler: on
  )


  purrr::walk2(selected_rows, text, rs_insert_at_row_start, id = context$id)

  # insert an empty line:  to display list correctly
  if (level == 1) {
    if (is_blank_line_needed_above(context)) {
      rs_insert_at_row_start(selected_rows[1], "\n", id = context$id)
    }
  }
  # Keep the rows selected --
  # TODO: account for one blank line, if it is inserted
  # rs_select_all_selected_rows(context = context)
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_list
#' @export
qmd_block_quotes <- function() {
  qmd_list(">")
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_list
#' @export
qmd_line_blocks <- function() {
  qmd_list("|")
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_list
#' @export
qmd_list_unordered <- function() {
  qmd_list("-", level = 1)
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_list
#' @export
qmd_list_unordered_2 <- function() {
  qmd_list("+", level = 2)
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_list
#' @export
qmd_list_numbered <- function() {
  qmd_list("numbered", level = 1)
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_list
#' @export
qmd_list_numbered_2 <- function() {
  qmd_list("numbered", level = 2)
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_list
#' @export
qmd_list_lettered <- function() {
  qmd_list("lettered", level = 1)
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_list
#' @export
qmd_list_lettered_2 <- function() {
  qmd_list("lettered", level = 2)
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_list
#' @export
qmd_list_z_example_list <- function() {
  qmd_list("(@)")
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#' Remove list-like formatting
#'
#' The function removes markup of lists, block quotes and line blocks.
#' More specifically, removes leading |, >, *, -, + symbols followed by a space or end of line,
#' leading arabic and Roman numbers, single letters, hash (`#`) or eta `@` symbols either followed by a dot or a closing parentheses or enclosed with parentheses. The symbol or the combination must be preceeded with no more than 1 space and followed by either a space or an end of a line, i.e., to be a valid markup, which is interpreted as a list.
#'
#' @inheritParams addin.tools::rs_get_index
#'
#' @export

# FIXME: Does not remove this list correctly in this situation:
# - 1.
# - 2.
# - 3.
# - 4.
# - 5.

qmd_remove_list <- function(context = rs_get_context()) {
  # Roman numbers (capital and small)
  rom_c <- "(M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3}))"
  rom_s <- "(m{0,4}(cm|cd|d?c{0,3})(xc|xl|l?x{0,3})(ix|iv|v?i{0,3}))"

  # ordered list elements
  ord <- stringr::str_glue("((#)|(@)|([[:digit:]]+)|([[:alpha:]])|{rom_s}|{rom_s})")

  level <- "" # level 1
  # level = "[[:blank:]]{0,1}" # level 1: must not select tab.
  # level = "[[:blank:]]{4}" # level 2: may be 1 tab or 4 spaces
  # level = "[[:blank:]]{8}" # level 2

  pattern <- stringr::str_glue("^{level}(([|>*+-])|({ord}[\\.\\)])|(\\({ord}\\)))(\\s|$)")
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  lines <- rs_get_selected_rows(context)
  wo_list <- stringr::str_replace(lines, pattern, "")

  if (!isTRUE(all.equal.character(lines, wo_list, check.attributes = FALSE))) {
    inds <- attr(lines, "row_numbers")
    selected_lines <- rstudioapi::document_range(c(min(inds), 1), c(max(inds), Inf))
    wo_list <- paste0(wo_list, collapse = "\n")
    rstudioapi::modifyRange(location = selected_lines, wo_list, id = context$id)
  }
  # Keep the rows selected
  rs_select_all_selected_rows(context = context)
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
