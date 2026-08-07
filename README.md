
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

<!-- [![CRAN_Status](https://www.r-pkg.org/badges/version/addins.qmd)](https://cran.r-project.org/package=addins.qmd) -->

[![MIT
licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub
version](https://img.shields.io/badge/GitHub-0.0.1-brightgreen.svg)](https://github.com/GegznaV/addins.qmd)
[![R-CMD-check](https://github.com/GegznaV/addins.qmd/workflows/R-CMD-check/badge.svg)](https://github.com/GegznaV/addins.qmd/actions)
[![Codecov test
coverage](https://codecov.io/gh/GegznaV/addins.qmd/graph/badge.svg)](https://app.codecov.io/gh/GegznaV/addins.qmd)
[![Updated-on](https://img.shields.io/badge/Updated%20on-2026--08--07-yellowgreen.svg)](https://github.com/GegznaV/addins.qmd/commits/master)
<!-- badges: end -->

------------------------------------------------------------------------

# R package **addins.qmd** <img src="man/figures/logo.png" align="right" height="136" alt="" />

Package `addins.qmd` is an *R* package that provides a set of *RStudio*
add-ins for *Quarto* documents. The main purpose of this package is to
make learning Quarto and Pandoc Markdown syntax faster.

## Install Package

Install package from CRAN-like repository:

``` r
repos <- c("https://mokymai.github.io/download/", getOption("repos"))
install.packages("addins.qmd", repos = repos)
```

<details>

<summary>

Install from GitHub
</summary>

Install development version from GitHub:

``` r
if (!require(remotes)) {
  install.packages("remotes")
}

remotes::install_github("GegznaV/addin.tools")
remotes::install_github("GegznaV/addins.qmd")
```

</details>

# How to Use These Add-ins

For the current version of the package:

1)  Find and click *RStudio* “Addins” button;
2)  Type **`{qmd}`** in the add-ins search box;
3)  All the add-ins of the package **addins.qmd** will be displayed in
    the drop-down list below.

<div class="figure">

<img src="https://gegznav.github.io/addins.qmd/figs/steps-search-addins.png" alt="**Fig. 1.** Steps to find addins of the package **addins.qmd**.  " width="400" />
<p class="caption">

**Fig. 1.** Steps to find addins of the package **addins.qmd**.
</p>

</div>

Below you can find a few examples how to use the add-ins of the package.

## Convert Text into Headings

<div class="figure">

<img src="https://gegznav.github.io/addins.qmd/figs/demo-headings-1.gif" alt="**Fig. 2.** **Demonstration 1: headings.**
Place a cursor with a mouse and use a necessary add-in.
*(In this demonstration, older version of the package is used.)*" width="600" />
<p class="caption">

**Fig. 2.** **Demonstration 1: headings.** Place a cursor with a mouse
and use a necessary add-in. *(In this demonstration, older version of
the package is used.)*
</p>

</div>

<br>

<div class="figure">

<img src="https://gegznav.github.io/addins.qmd/figs/demo-headings-2.gif" alt="**Fig. 3.** Demonstration 2: headings.** Notice that, if needed, a blank line above the selection is added.  " width="600" />
<p class="caption">

**Fig. 3.** Demonstration 2: headings.\*\* Notice that, if needed, a
blank line above the selection is added.
</p>

</div>

## Basic Text Formatting

<div class="figure">

<img src="https://gegznav.github.io/addins.qmd/figs/demo-formatting-1.gif" alt="**Fig. 4.** **Demonstration 3: basic formatting.**
Before using this type of add-in, select a piece of text that should be formatted.
*(In this demonstration, older version of the package is used.)*  " width="600" />
<p class="caption">

**Fig. 4.** **Demonstration 3: basic formatting.** Before using this
type of add-in, select a piece of text that should be formatted. *(In
this demonstration, older version of the package is used.)*
</p>

</div>

## Create Lists

<div class="figure">

<img src="https://gegznav.github.io/addins.qmd/figs/demo-lists-1.gif" alt="**Fig. 5.** **Demonstration 4: lists.**
The lists can be numbered and unnumbered.
They can have several levels.
*(In this demonstration, older version of the package is used.)*  " width="600" />
<p class="caption">

**Fig. 5.** **Demonstration 4: lists.** The lists can be numbered and
unnumbered. They can have several levels. *(In this demonstration, older
version of the package is used.)*
</p>

</div>

## Create R Code Chunks

<div class="figure">

<img src="https://gegznav.github.io/addins.qmd/figs/demo-chunk-add-1.gif" alt="**Fig. 6.** **Demonstration 5: R code chunks.**
Select one or several lines with code, select an appropriate add-in and include code into a chunk.  " width="600" />
<p class="caption">

**Fig. 6.** **Demonstration 5: R code chunks.** Select one or several
lines with code, select an appropriate add-in and include code into a
chunk.
</p>

</div>

## Quarto-First Scope

This package is Quarto-first. Most add-ins produce syntax that works in
Quarto documents and is powered by Pandoc Markdown.

Some add-ins have limited behavior in RStudio markdown Visual Editor
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

- <a href="https://pandoc.org/MANUAL.html#pandocs-markdown"
  target="_blank">https://pandoc.org/MANUAL.html#pandocs-markdown</a>

------------------------------------------------------------------------

Online documentation at <https://gegznav.github.io/addins.qmd/>
