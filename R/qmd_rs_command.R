# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Shared RStudio command helper.
#
# Description:
# Runs an RStudio command and returns TRUE when the command succeeds.
# When preserve_selection is TRUE, the current selection text is restored after
# command execution so chunk insertion commands can keep the selected text.
#
# Arguments:
# - command: character scalar with the RStudio command ID to run.
# - context: document context from rs_get_context(); required when
#   preserve_selection is TRUE.
# - preserve_selection: logical; when TRUE, the current selection is restored
#   after command execution.
run_rs_command <- function(command, context = NULL, preserve_selection = FALSE) {
  result <- tryCatch(
    {
      if (preserve_selection) {
        id <- context$id
        text <- rstudioapi::selectionGet(id = id)$value
        rstudioapi::executeCommand(command, quiet = TRUE)
        rstudioapi::selectionSet(text, id = id)
      } else {
        rstudioapi::executeCommand(command, quiet = TRUE)
      }

      TRUE
    },
    error = function(...) FALSE
  )

  if (isTRUE(result)) TRUE else FALSE
}