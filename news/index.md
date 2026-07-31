# Changelog

## addins.qmd 0.0.1

- Implemented Quarto-first transition updates in package metadata and
  README.
- Corrected wording/typos and switched core project links to HTTPS.
- Updated minimum supported R version to `R (>= 4.1)`.
- Updated `Suggests` from `rmarkdown` to `quarto` for Quarto-first
  alignment.
- Updated addins search guidance in README from `{md}` to `{qmd}`.
- Added compatibility shim for visual editor detection:
  - prefers
    [`addin.tools::is_visual_editor()`](https://gegznav.github.io/addin.tools/reference/is_visual_editor.html)
    when available,
  - falls back to
    [`addin.tools::is_rmd_visual_mode()`](https://gegznav.github.io/addin.tools/reference/is_visual_editor.html)
    for older addin.tools.
- Kept the startup message hook in `.onLoad()` per package policy.
- Added comprehensive testthat suite for wrappers/branches and edge
  cases.
- Added binding integrity test to verify all addin bindings resolve in
  package namespace.
- Reduced wrapper duplication in headings/lists/tables via shared
  internal helpers.
- Added reusable test fixtures for editor context and selected-row
  mocks.
- Documented API surface conventions and alias policy in package
  documentation.
- Rebased dependency policy with `rstudioapi (>= 0.18.0)` for
  command-driven Visual Editor support.
- Expanded command-driven Visual Editor support for inline formatting
  addins (`qmd_format_bold2`, `qmd_format_bold_italics`,
  `qmd_format_italics2`, `qmd_format_footnote`) with source-mode
  fallback.
- Updated GitHub Actions checkout steps to `actions/checkout@v4`.
- Added `NEWS.md` to track migration and release-ready changes.
