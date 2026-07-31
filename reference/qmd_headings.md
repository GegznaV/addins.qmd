# Format text as Quarto/Pandoc Markdown headings.

RStudio add-ins to format text as Quarto/Pandoc Markdown headings and to
remove this formatting.

## Usage

``` r
qmd_heading_hash(symbol, command, context = rs_get_context())

qmd_heading_1(context = rs_get_context())

qmd_heading_2(context = rs_get_context())

qmd_heading_3(context = rs_get_context())

qmd_heading_4(context = rs_get_context())

qmd_heading_5(context = rs_get_context())

qmd_heading_6(context = rs_get_context())

qmd_heading_1_title(context = rs_get_context())

qmd_heading_2_subtitle(context = rs_get_context())

qmd_heading_remove(
  style = c("auto", "both", "hash", "underline"),
  context = rs_get_context()
)
```

## Arguments

- context:

  (class `document_context`)  
  Object with context of active RStudio document.

- style:

  ("auto", "both", "hash", "underline") indicates which style of heading
  to remove:

  - "both" - removes both heading formatting styles;

  - "hash" - removes hash-style heading formatting only;

  - "underline" - removes underline-style heading formatting only;

  - "auto" - tries to remove only one style: if finds underline style,
    removes it, otherwise removes hash-style.

## Details

Function `qmd_heading_remove()` removes heading formatting: either
hash-symbol-style headings (i.e., remove leading hash symbols `#` and
spaces), or underline-style headings in the first selected row.  

The other functions, which name beginns with `qmd_heading_`, at first
apply `qmd_heading_remove()` to remove heading style (leading hash
symbols and underline) and then format the first selected row as a
heading of an appropriate level.
