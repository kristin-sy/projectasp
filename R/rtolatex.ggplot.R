#' convert ggplot to latex
#'
#' saves ggplots as pdf files
#' includes graphics command to insert it into your document
#'
#' @param x the ggplot
#' @param filename name of the file
#' @param path folder path
#' @param width width of the image
#' @param height height of the image
#' @param ... ignored only for syntax
#'
#' @return latex snippet
#' @export
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
#' rtolatex(p, filename = "my_plot")
rtolatex.ggplot <- function(x, filename, path = "outputs", width = 6, height = 4, ...) {
  #check filename
  if (missing(filename)) {
    stop("provide a `filename` for the plot")
  }
  #check/create directory
  if (!dir.exists(path)) {
    dir.create(path, recursive = TRUE)
  }

  #full file path
  filepath <- file.path(path, paste0(filename, ".pdf"))

  #ggplot as pdf
  ggplot2::ggsave(filepath, plot = x, width = width, height = height)

  #latex graphics insertion command
  code <- paste0(
    "\\begin{figure}[ht]\n",
    "\\centering\n",
    "\\includegraphics[width=\\linewidth]{", filepath, "}\n",
    "\\end{figure}"
  )

  #return as a latex snippet
  new_latex_snippet(code, type = "ggplot")
}
