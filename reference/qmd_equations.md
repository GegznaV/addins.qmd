# Format as LaTeX equation.

Select a piece of text with a cursor and call these functions as an
add-in to enclose the text with special symbols. Text between `$.$` is
interpreted as an inline equation and between `$$.$$` or `\[.\]` as a
block equation in Quarto/Pandoc Markdown.

## Usage

``` r
qmd_equation_inline(context = rs_get_context())

qmd_equation_block(context = rs_get_context())

qmd_equation_block2(context = rs_get_context())
```

## Arguments

- context:

  (class `document_context`)  
  Object with context of active RStudio document.

## See also

Other Quarto formatting add-ins:
[`format_md`](https://gegznav.github.io/addins.qmd/reference/format_md.md),
[`qmd_code_block()`](https://gegznav.github.io/addins.qmd/reference/qmd_code_block.md),
[`qmd_list()`](https://gegznav.github.io/addins.qmd/reference/qmd_list.md)
