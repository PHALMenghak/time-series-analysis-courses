required <- c("knitr", "rmarkdown", "TSA")
missing <- setdiff(required, rownames(installed.packages()))

if (length(missing) > 0L) {
  repos <- getOption("repos")
  if (is.null(repos) || identical(repos, c(CRAN = "@CRAN@")) || repos["CRAN"] == "@CRAN@") {
    repos <- "https://cloud.r-project.org"
  }
  install.packages(missing, repos = repos)
}

still_missing <- setdiff(required, rownames(installed.packages()))
if (length(still_missing) > 0L) {
  stop("Failed to install required R packages: ", paste(still_missing, collapse = ", "))
}

cat("Ready. R packages verified:", paste(required, collapse = ", "), "\n")
