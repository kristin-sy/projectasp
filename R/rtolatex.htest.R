#' convert a hypothesis test results to latex
#'
#' Takes the output of a hypothesis test like t.test() or chisq.test()
#' and formats it as a ready to use inline sentence in APA style.
#'
#' @param x result of a hypothesis test
#' @param ... ignored only for syntax
#'
#' @return latex snippet
#' @export
#'
#' @examples
#' rtolatex(t.test(rnorm(30), rnorm(30)))
#' rtolatex(chisq.test(c(10, 20, 30)))
rtolatex.htest <- function(x, ...) {
  # Get the test statistic and round it
  statistic <- round(x$statistic, 2)

  # Get the name of the statistic (e.g. "t" or "X-squared")
  stat_name <- names(x$statistic)

  # Format the p-value using our helper function
  p <- pvalue(x$p.value)

  # Build the sentence differently depending on the test type
  if (!is.null(x$parameter)) {
    # Tests with degrees of freedom, e.g. t-test
    df <- round(x$parameter, 0)
    code <- paste0(stat_name, "(", df, ") = ", statistic, ", p = ", p)
  } else {
    # Tests without degrees of freedom
    code <- paste0(stat_name, " = ", statistic, ", p = ", p)
  }

  # Return as a latex_snippet object
  new_latex_snippet(code, type = "htest")
}
