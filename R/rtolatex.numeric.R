#' convert numbers to latex
#'
#' turns the number to a latex reference
#' automatic updates when results are refreshed
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
#' rtolatex(0.5, name = "mean", digits = 2)
rtolatex.numeric <- function(x, name, digits = 2, ...) {
  if (length(x) != 1) {
    stop("`x` must be a single numeric value")
  }
  if (missing(name)) {
    stop("provide a `name` for the latex command")
  }
  rounded <- round(x, digits)
  safe_name <- specialcharacters(name)

  #latex command
  code <- paste0("\\newcommand{\\", safe_name, "}{", rounded, "}")

  #return as a latex snippet
  new_latex_snippet(code, type = "numeric")
}
