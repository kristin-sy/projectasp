#' convert dataframe into latex
#'
#' transforms dataframe to a latex tabular form
#' special characters are automatically adjust to latex
#'
#' @param x a dataframe
#' @param caption table caption
#' @param label label for table
#' @param digits digits to be rounded to
#' @param ... ignored only for syntax
#'
#' @return latex snippet
#' @export
#'
#' @examples
#' rtolatex(head(mtcars), caption = "Motor Trend Car Data", label = "tab:mtcars")
rtolatex.data.frame <- function(x, caption = "", label = "", digits = 2, ...) {
  x <- dplyr::mutate(x, dplyr::across(dplyr::where(is.numeric), ~ round(., digits))) #numeric rounding to 2 digits
  column_number <- ncol(x)
  column_align <- paste(rep("l", column_number), collapse = " ") #column alignment
  column_names <- sapply(colnames(x), specialcharacters) #special characters in column names
  header <- paste(column_names, collapse = " & ") #headers
  rows <- apply(x, 1, function(row) { #data
    escaped <- sapply(as.character(row), specialcharacters)
    paste(escaped, collapse = " & ")
  })

  #latex table
  code <- paste0(
    "\\begin{table}[ht]\n",
    "\\centering\n",
    "\\caption{", caption, "}\n",
    "\\label{", label, "}\n",
    "\\begin{tabular}{", column_align, "}\n",
    "\\hline\n",
    header, " \\\\\n",
    "\\hline\n",
    paste(rows, collapse = " \\\\\n"), " \\\\\n",
    "\\hline\n",
    "\\end{tabular}\n",
    "\\end{table}"
  )

  #return as a latex snippet
  new_latex_snippet(code, type = "data.frame")
}
