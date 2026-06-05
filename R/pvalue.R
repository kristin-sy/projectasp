pvalue <- function(p){
  if (p < 0|| p > 1) {
    stop("`p` should be between 0 and 1")
  }
  if (!is.numeric(p) || length(p) != 1) {
    stop("`p` must be a single numeric value")
  }
  if (p < 0.001) {
    return("< 0.001")
  }
  formatC(round(p, 3), format = "f", digits = 3)
}
