#' convert dataframe into latex
#'
#' Takes a data frame and turns it into a LaTeX tabular environment.
#' Special characters in the data are automatically escaped.
#'
#' @param x a dataframe
#' @param caption table caption
#' @param label label for table
#' @param ... ignored only for syntax
#'
#' @return latex snippet
#' @export
#'
#' @examples
#' rtolatex(head(mtcars), caption = "Motor Trend Car Data", label = "tab:mtcars")
rtolatex.data.frame <- function(x, caption = "", label = "", ...) {
  #number of columns
  n_cols <- ncol(x)

  # Column alignment - one "l" per column
  col_align <- paste(rep("l", n_cols), collapse = " ")

  #column name special characters
  col_names <- sapply(colnames(x), specialcharacters)

  #header row
  header <- paste(col_names, collapse = " & ")

  #data row
  rows <- apply(x, 1, function(row) {
    # Escape each cell value
    escaped <- sapply(as.character(row), specialcharacters)
    paste(escaped, collapse = " & ")
  })

  #latex table
  code <- paste0(
    "\\begin{table}[ht]\n",
    "\\centering\n",
    "\\caption{", caption, "}\n",
    "\\label{", label, "}\n",
    "\\begin{tabular}{", col_align, "}\n",
    "\\hline\n",
    header, " \\\\\n",
    "\\hline\n",
    paste(rows, collapse = " \\\\\n"), " \\\\\n",
    "\\hline\n",
    "\\end{tabular}\n",
    "\\end{table}"
  )

  # Return as a latex_snippet object
  new_latex_snippet(code, type = "data.frame")
}
