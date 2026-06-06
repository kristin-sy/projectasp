#' Turn R output into Latex
#'
#' @param x The R object to be converted
#' @param ... Additional object to the converted
#'
#' @returns Latex inputs
#' @export
#'
rtolatex <- function(x, ...) {
  UseMethod("rtolatex")
}

#' Default method for unsupported classes
#'
#' @param x An unsupported R object.
#' @param ... Ignored.
#' @export
rtolatex_error <- function(x, ...) { ##stopping message for infeasible r to latex
  stop(
    "No rtolatex() method for objects of class '",
    paste(class(x), collapse = "/"), "'.\n",
    "Supported classes: numeric, data.frame, htest, ggplot"
  )
}

#' @keywords internal
new_latex_snippet <- function(code, type) { ##define classes
  structure(
    list(code = code, type = type),
    class = "latex_snippet"
  )
}
#' Print a latex object
#'
#' @param x A latex_snippet object.
#' @param ... Ignored.
#' @export
printlatex <- function(x, ...) {
  cat("<latex_snippet [", x$type, "]>\n", sep = "")
  cat(x$code, "\n")
  invisible(x)
}

#' @examples
