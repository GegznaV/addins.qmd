# Compatibility wrapper for addin.tools visual editor detection.
# Uses the newer helper when available and falls back to the legacy alias.
is_visual_editor <- function(..., .get_ns = asNamespace) {
  addin_tools_ns <- .get_ns("addin.tools")

  if (exists("is_visual_editor", envir = addin_tools_ns, inherits = FALSE)) {
    return(get("is_visual_editor", envir = addin_tools_ns, inherits = FALSE)(...))
  }

  if (exists("is_rmd_visual_mode", envir = addin_tools_ns, inherits = FALSE)) {
    return(get("is_rmd_visual_mode", envir = addin_tools_ns, inherits = FALSE)(...))
  }

  FALSE
}
