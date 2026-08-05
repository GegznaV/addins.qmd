# Code -------------------------------------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @name qmd_code_block
#' @title Convert rows into the block of code.
#' @description
#' RStudio add-in to insert selected lines into code block: \itemize{
#'    \item `qmd_code_block()` - verbatim code block.
#'    \item `qmd_code_block_r()` - R code block.
#'          **Note!** In Visual Editor (VE) mode works differently:
#'          in VE mode, RStudio IDE command
#'          [`insertChunk`](https://docs.posit.co/ide/server-pro/rstudio_ide_commands/rstudio_ide_commands.html)
#'          is executed, which currently means that non-selected text will not
#'          be included in the chunk automatically. If the chunk is included as
#'          the last line of the document in VE mode, the selected text is
#'          interpreted as chunk options, otherwise as chunk contents.
#' }
#' `qmd_code_block_r_split()` - splits block of R code.
#'
#'
#' These functions internally use function
#' [addin.tools::rs_enclose_selected_rows_with()] -
#' that adds lines above and below the selection.
#'
#' @importFrom addin.tools rs_get_context is_visual_editor
#'
#' @inheritParams addin.tools::rs_get_index
#'
#' @family Quarto formatting add-ins
NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_code_block
#' @export
qmd_code_block_r <- function(context = rs_get_context()) {
  if (is_visual_editor()) {
    run_rs_command("insertChunkR", context, preserve_selection = TRUE)
    return(invisible(NULL))
  } else {
    rs_enclose_selected_rows_with(
      text_above = "```{r}",
      text_below = "```",
      context = context
    )
  }
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_code_block
#' @export
qmd_code_block_python <- function(context = rs_get_context()) {
  if (is_visual_editor()) {
    run_rs_command("insertChunkPython", context, preserve_selection = TRUE)
    return(invisible(NULL))
  } else {
    rs_enclose_selected_rows_with(
      text_above = "```{python}",
      text_below = "```",
      context = context
    )
  }
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_code_block
#' @export
qmd_code_block_sql <- function(context = rs_get_context()) {
  if (is_visual_editor()) {
    run_rs_command("insertChunkSQL", context, preserve_selection = TRUE)
    return(invisible(NULL))
  } else {
    rs_enclose_selected_rows_with(
      text_above = "```{sql}",
      text_below = "```",
      context = context
    )
  }
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_code_block
#' @export
qmd_code_block <- function(context = rs_get_context()) {
  if (is_visual_editor()) {
    run_rs_command("insertChunk", context, preserve_selection = TRUE)
    return(invisible(NULL))
  } else {
    rs_enclose_selected_rows_with(
      text_above = "```",
      text_below = "```",
      context = context
    )
  }
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_code_block
#' @export
qmd_code_block_r_split <- function(context = rs_get_context()) {
  if (is_visual_editor()) {
    run_rs_command("insertChunkR")
    return(invisible(NULL))
  } else {
    rs_enclose_selected_rows_with(
      text_above = "```\n\n```{r}",
      context = context
    )
  }
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
