#' convert a hypothesis test results to latex
#'
#' formats the output of a hypothesis test like t.test() to be used inline
#'
#' @param x result of a hypothesis test
#' @param ... ignored only for syntax
#'
#' @return latex snippet
#' @export
#'
#' @examples
#' rtolatex(t.test(rnorm(30), rnorm(30)))
rtolatex.htest <- function(x, ...) {
  tstat <- round(x$statistic, 2)
  tstat_name <- names(x$statistic)
  p <- pvalue(x$p.value)

  #formatting sentence
  if (!is.null(x$parameter)) {
    df <- round(x$parameter, 0)
    code <- paste0("$", tstat_name, "(", df, ") = ", tstat, ", p ", p, "$")
  } else {
    code <- paste0("$", tstat_name, " = ", tstat, ", p ", p, "$")
  }
  #return as a latex snippet
  new_latex_snippet(code, type = "htest")
}
