required <- c("knitr", "rmarkdown", "TSA")
missing <- setdiff(required, rownames(installed.packages()))

if (length(missing) > 0L) {
  install.packages(missing, repos = "https://cloud.r-project.org")
}

cat("Ready. R packages:", paste(required, collapse = ", "), "\n")
