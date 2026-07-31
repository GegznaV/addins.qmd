# Formatting ------------------------------------------------------------
#   \item \code{qmd_...()} as ... (\code{...} and \code{...});
#   \item \code{qmd_...()} as ... (\code{...} and \code{...});

# Function, symbols and interpretation \itemize{
#   \item \code{qmd_bold()}:           between \code{**} and \code{**} as bold;
#   \item \code{qmd_italics()}:        between \code{_} and \code{_} as italics;
#   \item \code{qmd_bold_italics()}:   between \code{**_} and \code{_**}as bold italics;
#   \item \code{qmd_bold2()}:          between \code{__} and \code{__} as bold;
#   \item \code{qmd_italics2()}:       between \code{*} and \code{*} as italics;
#   \item \code{qmd_code_inline()}:    between back-ticks (``) as inline code;
#   \item \code{qmd_r_code_inline()}:  formats text as inline R code to evaluate;
#   \item \code{qmd_superscript()}:    between \code{^} and \code{^} as superscript;
#   \item \code{qmd_subscript()}:      between \code{~} and \code{~} as subscript;
#   \item \code{qmd_strikethrough()}:  between \code{~~} and \code{~~} as strike-through text.
# }

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Add-ins for basic R Markdown formatting.
#'
#' RStudio add-ins, which enclose selected text with symbols that have special
#' interpretation in R Markdown.
#'
#' @inheritParams addin.tools::rs_get_index
#'
#' @name format_rmd
#' @family R Markdown formatting add-ins
#'
NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname format_rmd
#' @export
qmd_format_bold <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol = "**",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname format_rmd
#' @export
qmd_format_italics <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol = "_",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname format_rmd
#' @export
qmd_format_bold_italics <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol_before = "**_", symbol_after = "_**",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname format_rmd
#' @export
qmd_format_bold2 <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol = "__",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname format_rmd
#' @export
qmd_format_italics2 <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol = "*",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname format_rmd
#' @export
qmd_format_html_comment <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol_before = "<!--", symbol_after = "-->",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname format_rmd
#' @export
qmd_code_inline <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol = "`",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname format_rmd
#' @export
qmd_code_inline_r <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol_before = "`r ", symbol_after = "`",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname format_rmd
#' @export
qmd_code_inline_highlighted_as_r <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol_before = "`", symbol_after = "`{.r}",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname format_rmd
#' @export
qmd_format_superscript <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol = "^",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname format_rmd
#' @export
qmd_format_subscript <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol = "~",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname format_rmd
#' @export
qmd_format_strikethrough <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol = "~~",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname format_rmd
#' @export
qmd_format_footnote <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol_before = "^[", symbol_after = "]",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname format_rmd
#' @export
qmd_horizontal_rule <- function(context = rs_get_context()) {
  # Style ***
  # Style * * *
  # Style ___
  # Style _ _ _
  # Style ---
  # Style - - -
  rs_enclose_selected_rows_with(
    text_below = "* * *",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# TODO: 1. [!!!] change text "url_link" with text in selection;
#       2. Fix cursor position similarly as in `qmd_insert_figure_r_code_block`.
#       3. Create interactive add-in.

# https://stackoverflow.com/a/17773849/4783029
pattern_url <- "(https?://(?:www\\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\\.[^\\s]{2,}|www\\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\\.[^\\s]{2,}|https?://(?:www\\.|(?!www))[a-zA-Z0-9]+\\.[^\\s]{2,}|www\\.[a-zA-Z0-9]+\\.[^\\s]{2,})"

pattern_url_2 <- "^(((http(s)?|(ftp(s)?))://)(www\\.)?([a-zA-Z0-9][a-zA-Z0-9\\.\\/-]+[a-zA-Z0-9]\\.[^\\s]{2,})+(\\:[0-9]{5})?|(mailto:){1}([\\w\\.]+)\\@{1}[\\w]+\\.[\\w]{2,})\\s$"

#' @rdname format_rmd
#' @export
qmd_link_url <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol_before = "[", symbol_after = "](url_link)",
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# TODO: 1. [!!!] change text "path_to_figure" with text in selection;
#       2. Fix cursor position similarly as in `qmd_insert_figure_r_code_block`.
#       3. Create interactive add-in.
#
#' @rdname format_rmd
#' @export
qmd_insert_figure <- function(context = rs_get_context()) {
  rs_enclose_selection_with(
    symbol_before = "![", symbol_after = "](path_to_figure)",
    context = context
  )
}

#' @rdname format_rmd
#' @export
qmd_insert_figure_r_code_block <- function(context = rs_get_context()) {
  # Generate figure ID
  nr <- stringr::str_replace(as.character(unclass(Sys.time())), "\\.", "-")

  # Generate code block
  before <- stringr::str_glue(
    '```{{r fig-ID-{nr}, echo=FALSE, fig.cap=CAPTION}}
knitr::include_graphics("'
  )

  after <-
    '") # URL or path to your image.

CAPTION = "" # Figure caption/description.
```'

  # Insert text
  rs_enclose_selection_with(
    symbol_before = before,
    symbol_after = after,
    trim = TRUE,
    context = context
  )

  # Change cursor's position
  zero_selection <-
    isTRUE(nchar(stringr::str_trim(rs_get_selection_text(context = context))) == 0)

  if (zero_selection) {
    # Place cursor inside parentheses of `include_graphics`
    pos <- rstudioapi::document_position(
      row    = rs_get_index_first_selected_row(context = context) + 1,
      column = 26
    )
  } else {
    # Place cursor inside parentheses of `CAPTION`
    pos <- rstudioapi::document_position(
      row    = rs_get_index_first_selected_row(context = context) + 3,
      column = 12
    )
  }

  rstudioapi::setCursorPosition(pos, id = context$id)
}
