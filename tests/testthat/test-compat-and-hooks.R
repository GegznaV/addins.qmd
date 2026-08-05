test_that("run_rs_command returns TRUE when command succeeds", {
  local_mocked_bindings(
    executeCommand = function(command, quiet = TRUE) {
      expect_identical(command, "markdownBold")
      expect_true(isTRUE(quiet))
      invisible(NULL)
    },
    .package = "rstudioapi"
  )

  expect_true(addins.qmd:::run_rs_command("markdownBold"))
})

test_that("run_rs_command returns FALSE on command error", {
  local_mocked_bindings(
    executeCommand = function(command, quiet = TRUE) {
      stop("command not available")
    },
    .package = "rstudioapi"
  )

  expect_false(addins.qmd:::run_rs_command("doesNotExist"))
})
