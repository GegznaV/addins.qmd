test_that("all addins.dcf bindings resolve in package namespace", {
  dcf_path <- system.file("rstudio", "addins.dcf", package = "addins.qmd")
  expect_true(file.exists(dcf_path))

  addins <- read.dcf(dcf_path)
  bindings <- unique(trimws(addins[, "Binding"]))
  bindings <- bindings[nzchar(bindings)]

  ns <- asNamespace("addins.qmd")
  missing <- bindings[!vapply(bindings, exists, logical(1), envir = ns, inherits = FALSE)]

  if (length(missing) > 0) {
    fail(paste("Missing bindings:", paste(missing, collapse = ", ")))
  }

  expect_length(missing, 0)
})
