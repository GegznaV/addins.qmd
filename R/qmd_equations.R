# TODO: rewrite the functions for Visual Markdown Editor mode.

# Equations -------------------------------------------------------------------
#' Format as LaTeX equation.
#'
#' Select a piece of text with a cursor and call these functions as an add-in
#' to enclose the text with special symbols. Text between `$.$` is
#' interpreted as an inline equation and between `$$.$$` or `\[.\]`
#' as a block equation in Quarto/Pandoc Markdown.
#'
#' @name qmd_equations
#'
#' @inheritParams addin.tools::rs_get_index
#'
#' @family Quarto formatting add-ins
NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_equations
#' @export
qmd_equation_a_inline <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol = "$",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_equations
#' @export
qmd_equation_b_block <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol = "$$",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_equations
#' @export
qmd_equation_b_block2 <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol_before = "\\[", symbol_after = "\\]",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
