#' convert ggplot to latex
#'
#' Saves a ggplot object as a PDF file and returns a LaTeX snippet
#' with the includegraphics command to insert it into your document.
#'
#' @param x the ggplot itself
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
  # Check that a filename was provided
  if (missing(filename)) {
    stop("You must provide a `filename` for the plot.")
  }

  # Create the output folder if it doesn't exist
  if (!dir.exists(path)) {
    dir.create(path, recursive = TRUE)
  }

  # Build the full file path
  filepath <- file.path(path, paste0(filename, ".pdf"))

  # Save the ggplot as a PDF
  ggplot2::ggsave(filepath, plot = x, width = width, height = height)

  # Build the LaTeX includegraphics command
  code <- paste0(
    "\\begin{figure}[ht]\n",
    "\\centering\n",
    "\\includegraphics[width=\\linewidth]{", filepath, "}\n",
    "\\end{figure}"
  )

  # Return as a latex_snippet object
  new_latex_snippet(code, type = "ggplot")
}
