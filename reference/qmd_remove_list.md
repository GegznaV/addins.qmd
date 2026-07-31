# Remove list-like formatting

The function removes markup of lists, block quotes and line blocks. More
specifically, removes leading \|, \>, \*, -, + symbols followed by a
space or end of line, leading arabic and Roman numbers, single letters,
hash (`#`) or eta `@` symbols either followed by a dot or a closing
parentheses or enclosed with parentheses. The symbol or the combination
must be preceeded with no more than 1 space and followed by either a
space or an end of a line, i.e., to be a valid markup, which is
interpreted as a list.

## Usage

``` r
qmd_remove_list(context = rs_get_context())
```

## Arguments

- context:

  (class `document_context`)  
  Object with context of active RStudio document.
