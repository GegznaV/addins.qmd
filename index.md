# R package **addins.qmd**

------------------------------------------------------------------------

Package `addins.qmd` is an *R* package that provides a set of *RStudio*
add-ins for *Quarto* documents. The main purpose of this package is to
make learning Quarto and Pandoc Markdown syntax faster.

## Install Package

Install package from CRAN-like repository:

``` r

repos <- c("https://mokymai.github.io/download/", getOption("repos"))
install.packages("addins.qmd", repos = repos)
```

Install from GitHub

Install development version from GitHub:

``` r

if (!require(remotes)) {
  install.packages("remotes")
}

remotes::install_github("GegznaV/addin.tools")
remotes::install_github("GegznaV/addins.qmd")
```

# How to Use These Add-ins

For the current version of the package:

1.  Find and click *RStudio* “Addins” button;
2.  Type **`{qmd}`** in the add-ins search box;
3.  All the add-ins of the package **addins.qmd** will be displayed in
    the drop-down list below.

![\*\*Fig. 1.\*\* Steps to find addins of the package
\*\*addins.qmd\*\*.
](https://gegznav.github.io/addins.qmd/figs/steps-search-addins.png)

**Fig. 1.** Steps to find addins of the package **addins.qmd**.

Below you can find a few examples how to use the add-ins of the package.

## Convert Text into Headings

![\*\*Fig. 2.\*\* \*\*Demonstration 1: headings.\*\* Place a cursor with
a mouse and use a necessary add-in. \*(In this demonstration, older
version of the package is
used.)\*](https://gegznav.github.io/addins.qmd/figs/demo-headings-1.gif)

**Fig. 2.** **Demonstration 1: headings.** Place a cursor with a mouse
and use a necessary add-in. *(In this demonstration, older version of
the package is used.)*

  

![\*\*Fig. 3.\*\* Demonstration 2: headings.\*\* Notice that, if needed,
a blank line above the selection is added.
](https://gegznav.github.io/addins.qmd/figs/demo-headings-2.gif)

**Fig. 3.** Demonstration 2: headings.\*\* Notice that, if needed, a
blank line above the selection is added.

## Basic Text Formatting

![\*\*Fig. 4.\*\* \*\*Demonstration 3: basic formatting.\*\* Before
using this type of add-in, select a piece of text that should be
formatted. \*(In this demonstration, older version of the package is
used.)\*
](https://gegznav.github.io/addins.qmd/figs/demo-formatting-1.gif)

**Fig. 4.** **Demonstration 3: basic formatting.** Before using this
type of add-in, select a piece of text that should be formatted. *(In
this demonstration, older version of the package is used.)*

## Create Lists

![\*\*Fig. 5.\*\* \*\*Demonstration 4: lists.\*\* The lists can be
numbered and unnumbered. They can have several levels. \*(In this
demonstration, older version of the package is used.)\*
](https://gegznav.github.io/addins.qmd/figs/demo-lists-1.gif)

**Fig. 5.** **Demonstration 4: lists.** The lists can be numbered and
unnumbered. They can have several levels. *(In this demonstration, older
version of the package is used.)*

## Create R Code Chunks

![\*\*Fig. 6.\*\* \*\*Demonstration 5: R code chunks.\*\* Select one or
several lines with code, select an appropriate add-in and include code
into a chunk.
](https://gegznav.github.io/addins.qmd/figs/demo-chunk-add-1.gif)

**Fig. 6.** **Demonstration 5: R code chunks.** Select one or several
lines with code, select an appropriate add-in and include code into a
chunk.

## Quarto-First Scope

This package is Quarto-first. Most add-ins produce syntax that works in
Quarto documents and is powered by Pandoc Markdown.

Some add-ins have limited behavior in RStudio Markdown Visual Editor
mode. When this happens, use Source editor mode or the related native
Visual Editor command.

## API Surface Conventions

- Exported functions with the `qmd_` prefix are the supported
  user-facing addins.
- Some addin bindings intentionally target non-exported functions for
  RStudio addin dispatch compatibility.
- Non-exported helper functions are internal and may change between
  releases.
- Visual Editor command support is implemented incrementally and falls
  back to source-mode behavior or warnings when commands are
  unavailable.

# See Also

Use the links below to learn more about RStudio add-ins and especially
how to use them in combination with user-defined keyboard shortcuts:

1.  [RStudio add-ins](https://rstudio.github.io/rstudioaddins/);
2.  [Keyboard
    shortcuts](https://rstudio.github.io/rstudioaddins/#keyboard-shortcuts);
3.  [Customizing keyboard
    shortcuts.](https://support.rstudio.com/hc/en-us/articles/206382178-Customizing-Keyboard-Shortcuts)

## Quarto Markdown (Pandoc)

Quarto markdown is based on Pandoc’s Markdown syntax. If you need more
advanced formatting options, please, read more at:

- [https://pandoc.org/MANUAL.html#pandocs-markdown](https://pandoc.org/MANUAL.html#pandocs-markdown)

------------------------------------------------------------------------

Online documentation at <https://gegznav.github.io/addins.qmd/>
