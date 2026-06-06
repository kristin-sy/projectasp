#' convert numbers to latex
#'
#' Takes a numeric value and turns it into a LaTeX newcommand macro.
#' You can then use that command anywhere in your .tex file.
#'
#' @param x a single numeric value
#' @param name name of latex command
#' @param digits decimal place rounding
#' @param ... ignored only for syntax
#'
#' @return latex snippet
#' @export
#'
#' @examples
#' rtolatex(0.94, name = "accuracy", digits = 2)
rtolatex.numeric <- function(x, name, digits = 2, ...) {
  # Check that x is a single number
  if (length(x) != 1) {
    stop("`x` must be a single numeric value")
  }

  # Check that a name was provided
  if (missing(name)) {
    stop("provide a `name` for the latex command.")
  }

  #round to decimal
  rounded <- round(x, digits)

  #special character treatment
  safe_name <- specialcharacters(name)

  #latex \newcommand string
  code <- paste0("\\newcommand{\\", safe_name, "}{", rounded, "}")

  # Return as a latex_snippet object
  new_latex_snippet(code, type = "numeric")
}
