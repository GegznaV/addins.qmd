# Add-ins for basic Quarto/Pandoc Markdown formatting.

RStudio add-ins, which enclose selected text with symbols that have
special interpretation in Quarto/Pandoc Markdown.

## Usage

``` r
qmd_format_bold(context = rs_get_context())

qmd_format_italics(context = rs_get_context())

qmd_format_bold_italics(context = rs_get_context())

qmd_format_bold2(context = rs_get_context())

qmd_format_italics2(context = rs_get_context())

qmd_html_comment(context = rs_get_context())

qmd_code_inline(context = rs_get_context())

qmd_code_inline_r(context = rs_get_context())

qmd_code_inline_highlighted_as_r(context = rs_get_context())

qmd_format_superscript(context = rs_get_context())

qmd_format_subscript(context = rs_get_context())

qmd_format_strikethrough(context = rs_get_context())

qmd_format_footnote(context = rs_get_context())

qmd_horizontal_rule(context = rs_get_context())

qmd_link_url(context = rs_get_context())

qmd_insert_figure(context = rs_get_context())

qmd_insert_figure_r_code_block(context = rs_get_context())

qmd_symbol_asterisk(context = rs_get_context())

qmd_symbol_backslash(context = rs_get_context())

qmd_symbol_underscore(context = rs_get_context())

qmd_symbol_dollar(context = rs_get_context())

qmd_symbol_en_dash(context = rs_get_context())

qmd_symbol_em_dash(context = rs_get_context())
```

## Arguments

- context:

  (class `document_context`)  
  Object with context of active RStudio document.

## See also

https://pandoc.org/MANUAL.html#backslash-escapes

Other Quarto formatting add-ins:
[`qmd_code_block()`](https://gegznav.github.io/addins.qmd/reference/qmd_code_block.md),
[`qmd_equations`](https://gegznav.github.io/addins.qmd/reference/qmd_equations.md),
[`qmd_list()`](https://gegznav.github.io/addins.qmd/reference/qmd_list.md)
