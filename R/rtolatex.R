rtolatex <- function(x, ...) {
  UseMethod("rtolatex")
}

to_latex.default <- function(x, ...) {
  stop(
    "No rtolatex() method for objects of class '",
    paste(class(x), collapse = "/"), "'.\n",
    "Supported classes: numeric, data.frame, htest, ggplot"
  )
}

new_latex_snippet <- function(code, type) {
  structure(
    list(code = code, type = type),
    class = "latex_snippet"
  )
}

print.latex_snippet <- function(x, ...) {
  cat("<latex_snippet [", x$type, "]>\n", sep = "")
  cat(x$code, "\n")
  invisible(x)
}
