# Convert rows into the block of code.

RStudio add-in to insert selected lines into code block:

- `qmd_code_block()` - verbatim code block.

- `qmd_code_block_r()` - R code block. **Note!** In Visual Editor (VE)
  mode works differently: in VE mode, RStudio IDE command
  [`insertChunk`](https://docs.posit.co/ide/server-pro/rstudio_ide_commands/rstudio_ide_commands.html)
  is executed, which currently means that non-selected text will not be
  included in the chunk automatically. If the chunk is included as the
  last line of the document in VE mode, the selected text is interpreted
  as chunk options, otherwise as chunk contents.

`qmd_code_block_r_split()` - splits block of R code.

These functions internally use function
[`addin.tools::rs_enclose_selected_rows_with()`](https://gegznav.github.io/addin.tools/reference/rs_enclose_with_lines.html) -
that adds lines above and below the selection.

## Usage

``` r
qmd_code_block_r(context = rs_get_context())

qmd_code_block_python(context = rs_get_context())

qmd_code_block_sql(context = rs_get_context())

qmd_code_block(context = rs_get_context())

qmd_code_block_r_split(context = rs_get_context())
```

## Arguments

- context:

  (class `document_context`)  
  Object with context of active RStudio document.

## See also

Other Quarto formatting add-ins:
[`format_md`](https://gegznav.github.io/addins.qmd/reference/format_md.md),
[`qmd_equations`](https://gegznav.github.io/addins.qmd/reference/qmd_equations.md),
[`qmd_list()`](https://gegznav.github.io/addins.qmd/reference/qmd_list.md)
