#validator to check for type
validate_latex_snippet <- function(x) {
  if (!is.character(x$code) || length(x$code) != 1) {
    stop("`code` must be a single character string")
  }
  if (!is.character(x$type) || length(x$type) != 1) {
    stop("`type` must be a single character string")
  }
  x
}

#constructor for rtolatex
new_latex_snippet <- function(code = character(), type = character()) {
  x <- structure(
    list(code = code, type = type),
    class = "latex_snippet"
  )
  validate_latex_snippet(x)
}

#' turn R output into latex
#'
#' @param x object to be converted into latex
#' @param ... other objects that need to be converted
#'
#' @returns latex formatted inputs
#' @export
#'
rtolatex <- function(x, ...) {
  UseMethod("rtolatex")
}

#' alternative function when the object is not supported
#'
#' @param x object that is not supported
#' @param ... ignored only for syntax
#' @export
rtolatex.default <- function(x, ...) {
  stop(
    "No rtolatex() method for objects of class '",
    paste(class(x), collapse = "/"), "'.\n",
    "Classes supported must fall within: numeric, data.frame, htest, ggplot"
  )
}
#' print latex objects
#'
#' @param x a latex snippet
#' @param ... ignored only for syntax
#' @export
print.latex_snippet <- function(x, ...) {
  cat("<latex_snippet [", x$type, "]>\n", sep = "")
  cat(x$code, "\n")
  invisible(x)
}

#' @examples
