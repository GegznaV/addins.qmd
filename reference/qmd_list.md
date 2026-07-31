# Format text as Quarto/Pandoc Markdown list.

RStudio add-ins which format text as Quarto/Pandoc Markdown lists. For
the first-level lists:

- `qmd_list()` - the main function, that make lists;

- `qmd_unordered_list()` - unordered list;

- `qmd_numbered_list()` - numbered list;

- `qmd_lettered_list()` - lettered list (non-capital English letters);

- `qmd_master_list()` - master list (which numbering continues
  throughout the document).

## Usage

``` r
qmd_list(type = "unordered", level = 1, context = rs_get_context())

qmd_block_quotes()

qmd_line_blocks()

qmd_list_unordered()

qmd_list_unordered_2()

qmd_list_numbered()

qmd_list_numbered_2()

qmd_list_lettered()

qmd_list_lettered_2()

qmd_list_z_example_list()
```

## Arguments

- type:

  (character) the type of list "unordered", "numbered", "lettered",
  "LETTERED", "master", or list like elements "block quotes" and "line
  blocks".

- level:

  (integer) the level of list.

- context:

  (class `document_context`)  
  Object with context of active RStudio document.

## See also

Other Quarto formatting add-ins:
[`format_rmd`](https://gegznav.github.io/addins.qmd/reference/format_rmd.md),
[`qmd_code_block()`](https://gegznav.github.io/addins.qmd/reference/qmd_code_block.md),
[`qmd_equations`](https://gegznav.github.io/addins.qmd/reference/qmd_equations.md)
