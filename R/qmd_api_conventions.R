#' API Surface Conventions
#'
#' The package follows these conventions for public and internal APIs:
#'
#' * Exported functions with `qmd_` prefix are the primary user-facing addins.
#' * Addin bindings listed in `inst/rstudio/addins.dcf` may intentionally point
#'   to non-exported functions for compatibility with RStudio addin dispatch.
#' * Non-exported helper functions are internal implementation details and may
#'   change between releases without deprecation guarantees.
#' * Visual Editor command support is incremental and best-effort; unsupported
#'   commands should fall back to source-mode behavior or emit a warning.
#'
#' Alias policy:
#'
#' * Canonical `qmd_*` names are the supported entry points.
#' * New aliases are only introduced when they improve compatibility, and should
#'   be documented in [NEWS.md](../NEWS.md).
#'
#' @name qmd_api_conventions
#' @keywords internal
NULL
