# CRAN Submission Checklist

## Pre-checks

- [ ] `devtools::test()` passes locally.
- [ ] `devtools::check()` has no errors or warnings.
- [ ] `R CMD check` NOTE entries are reviewed and either fixed or intentionally accepted.
- [ ] `lintr::lint_package()` passes.
- [ ] `styler::style_pkg(strict = FALSE, dry = "fail")` passes.

## Documentation and metadata

- [ ] `devtools::document(roclets = c("rd", "collate", "namespace"))` has been run.
- [ ] `README.md` regenerated from `README.Rmd`.
- [ ] pkgdown site regenerated and checked for stale pages.
- [ ] `DESCRIPTION` version bumped for release.
- [ ] `NEWS.md` updated with release notes.
- [ ] URLs in `DESCRIPTION` and docs use HTTPS and are valid.

## Dependencies and workflows

- [ ] Required dependency versions are pinned in `DESCRIPTION`.
- [ ] Workflow files under `.github/workflows/` use current action majors (`actions/checkout@v4`, `r-lib/actions/*@v3`).
- [ ] Any artifact actions use `actions/upload-artifact@v4` and `actions/download-artifact@v4`.

## Release

- [ ] Final source tarball builds cleanly.
- [ ] Tag and release notes are prepared.
- [ ] CRAN submission form details are ready (title/description/comments).
