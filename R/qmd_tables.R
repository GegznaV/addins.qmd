# Tables ---------------------------------------------------------------------

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @name qmd_tables
#' @title Insert Quarto/Pandoc Markdown tables
#' @description Insert examples of Quarto/Pandoc Markdown tables.
#' @inheritParams addin.tools::rs_get_index

NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_tables
qmd_table_style_md <- function(context = rs_get_context()) {
  rs_enclose_first_row_with(
    text_above = tbl_md,
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_tables
qmd_table_style_md_alternative <- function(context = rs_get_context()) {
  rs_enclose_first_row_with(
    text_above = tbl_md_alternative,
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_tables
qmd_table_style_multiline <- function(context = rs_get_context()) {
  rs_enclose_first_row_with(
    text_above = tbl_multiline,
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_tables
qmd_table_style_multiline_no_colnames <- function(context = rs_get_context()) {
  rs_enclose_first_row_with(
    text_above = tbl_multiline_no_colnames,
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_tables
qmd_table_style_simple <- function(context = rs_get_context()) {
  rs_enclose_first_row_with(
    text_above = tbl_simple,
    context = context
  )
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname qmd_tables
qmd_table_style_grid <- function(context = rs_get_context()) {
  rs_enclose_first_row_with(
    text_above = tbl_grid,
    context = context
  )
}




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tbl_simple <- c(
  "

Left-aligned      Centered column       Right-aligned
--------------  -------------------  ----------------
Row_1_Col_1        Row_1_Col_2          Row_1_Col_3
Row_2_Col_1        Row_2_Col_2          Row_2_Col_3
Row_3_Col_1        Row_3_Col_2          Row_3_Col_3

: The caption of the simple-style table.

"
)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tbl_md <- c(
  "

Auto-aligned  | Left-aligned  |   Centered    | Right-aligned
------------- | :------------ | :-----------: | ------------:
 Row_1_Col_1  |  Row_1_Col_2  |  Row_1_Col_3  |  Row_1_Col_4
 Row_2_Col_1  |  Row_2_Col_2  |  Row_2_Col_3  |  Row_2_Col_4
 Row_3_Col_1  |  Row_3_Col_2  |  Row_3_Col_3  |  Row_3_Col_4

: The caption of the markdown-style table.

"
)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

tbl_md_alternative <- c(
  "

| Auto-aligned  | Left-aligned  |   Centered    | Right-aligned |
| ------------- | :------------ | :-----------: | ------------: |
|  Row_1_Col_1  |  Row_1_Col_2  |  Row_1_Col_3  |  Row_1_Col_4  |
|  Row_2_Col_1  |  Row_2_Col_2  |  Row_2_Col_3  |  Row_2_Col_4  |
|  Row_3_Col_1  |  Row_3_Col_2  |  Row_3_Col_3  |  Row_3_Col_4  |

: The caption of the markdown-style table.

"
)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tbl_multiline <- c(
  "

-----------------------------------------------------
Left-aligned      Centered column      Right-aligned
---------------- -----------------  ----------------
Row_1_Col_1        Row_1_Col_2         Row_1_Col_3

Row_2_Col_1        Row_2_Col_2         Row_2_Col_3

Row_3_Col_1        Row_3_Col_2         Row_3_Col_3
-----------------------------------------------------

: The caption of the multi-row table.

"
)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tbl_multiline_no_colnames <- c(
  "

--------------  -----------------  ----------------
Row_1_Col_1        Row_1_Col_2          Row_1_Col_3

Row_2_Col_1        Row_2_Col_2          Row_2_Col_3

Row_3_Col_1        Row_3_Col_2          Row_3_Col_3
--------------  -----------------  ----------------

: The caption of the table without column names.

"
)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tbl_grid <- c(
  "

+---------------+---------------+--------------------+
| Right-aligned |  Centered     |  Auto-aligned      |
+==============:+:=============:+====================+
| Row_1_Col_1   | Row_1_Col_2   | - Row_1_Col_3a     |
|               |               | - Row_1_Col_3b     |
+---------------+---------------+--------------------+
| Row_2_Col_1   | Row_2_Col_2   | - Row_2_Col_3a     |
|               |               | - Row_2_Col_3b     |
+---------------+---------------+--------------------+

:  The caption of the grid-style table.

"
)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
