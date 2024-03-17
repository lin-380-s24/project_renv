# Check if renv.lock file exists
if (file.exists("renv.lock")) {
  # Load the renv package
  if (!requireNamespace("renv", quietly = TRUE)) {
    install.packages("renv")
  }

  # Restore the renv environment
  renv::restore()

  # Check if running in RStudio
  if (!requireNamespace("rstudioapi", quietly = TRUE)) {
    install.packages("rstudioapi")
  }

  # Restart R session
  rstudioapi::restartSession()
} else {
  message("No renv.lock file found in the current directory.")
}
