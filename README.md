
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![MIT
licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/addins.qmd)](https://cran.r-project.org/package=addins.qmd)
[![GitHub
version](https://img.shields.io/badge/GitHub-0.0.1-brightgreen.svg)](https://github.com/GegznaV/addins.qmd)
[![R-CMD-check](https://github.com/GegznaV/addins.qmd/workflows/R-CMD-check/badge.svg)](https://github.com/GegznaV/addins.qmd/actions)
[![Updated-on](https://img.shields.io/badge/Updated%20on-2026--07--31-yellowgreen.svg)](/commits/master)
<!-- badges: end -->

------------------------------------------------------------------------

<!-- 

-->

<img src="https://gegznav.github.io/addins.qmd/logo.png" align="right" width="15%" height="15%"/>

# R package **addins.qmd**

Package `addins.qmd` is an *R* package that provides a set of *RStudio*
add-ins for *Quarto* documents. The main purpose of this package is to
make learning Quarto and Pandoc Markdown syntax faster.

<!-- 

1) **format text in Quarto documents**:
  - **enclose** either selected text or selected rows with special symbols and text gets interpreted in a special way when rendered with Quarto/Pandoc Markdown (e.g., converts "bold" into "\*\*bold\*\*"
that is interpreted as "**bold**").
2) **insert** text (e.g., operators `%>%`, `<<-`, `%$%`) at the cursor position;
3)  **replace** symbols in selected
pieces of text (e.g., convert backslashes to forward slashes which results
in strings like `"c:\data\"` converted into `"c:/data/"`).

-->

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

<!-- 
Recommended workflow and a few examples
-----------------------------------------------------

Get started online http://gegznav.github.io/addins.qmd/articles/v1_workflow.html

And offline:

``` r
vignette("v1_workflow", package = "addins.qmd")
```
browseVignettes("addins.qmd") 
-->

For the current version of the package:

1.  Find and click *RStudio* “Addins” button;
2.  Type **`{qmd}`** in the add-ins search box;
3.  All the add-ins of the package **addins.qmd** will be displayed in
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
*(In this demonstrations, older version of the package is used.)*" width="600" />
<p class="caption">
**Fig. 2.** **Demonstration 1: headings.** Place a cursor with a mouse
and use a necessary add-in. *(In this demonstrations, older version of
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
*(In this demonstrations, older version of the package is used.)*  " width="600" />
<p class="caption">
**Fig. 4.** **Demonstration 3: basic formatting.** Before using this
type of add-in, select a piece of text that should be formatted. *(In
this demonstrations, older version of the package is used.)*
</p>

</div>

## Create Lists

<div class="figure">

<img src="https://gegznav.github.io/addins.qmd/figs/demo-lists-1.gif" alt="**Fig. 5.** **Demonstration 4: lists.**
The lists can be numbered and unnumbered.
They can have several levels.
*(In this demonstrations, older version of the package is used.)*  " width="600" />
<p class="caption">
**Fig. 5.** **Demonstration 4: lists.** The lists can be numbered and
unnumbered. They can have several levels. *(In this demonstrations,
older version of the package is used.)*
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

Some add-ins have limited behavior in RStudio Markdown Visual Editor
mode. When this happens, use Source editor mode or the related native
Visual Editor command.

# See Also

Use the links below to learn more about RStudio add-ins and especially
how to use them in combination with user-defined keyboard shortcuts:

1.  [RStudio add-ins](https://rstudio.github.io/rstudioaddins/);
2.  [Keyboard
    shortcuts](https://rstudio.github.io/rstudioaddins/#keyboard-shorcuts);
3.  [Customizing keyboard
    shortcuts.](https://support.rstudio.com/hc/en-us/articles/206382178-Customizing-Keyboard-Shortcuts)

## Quarto Markdown (Pandoc)

Quarto markdown is based on Pandoc’s Markdown syntax. If you need more
advanced formatting options, please, read more at:

-   <https://pandoc.org/MANUAL.html#pandocs-markdown>

------------------------------------------------------------------------

Online documentation at <https://gegznav.github.io/addins.qmd/>
