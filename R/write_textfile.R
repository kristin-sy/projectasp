#' writing all snippets as .tex files for latex
#'
#' creates a .tex file for each entry in the document container
#' as a separate .tex file in the output folder
#' files get reference in latex using the input command
#'
#' @param doc document container object
#' @param ... ignored only for syntax
#'
#' @return returns document container
#' @export
#'
#' @examples
#' doc <- document_container()
#' doc <- add_snippet(doc, rtolatex(0.94, name = "accuracy"), "accuracy")
#' write_textfile(doc)
write_textfile <- function(doc, ...) {
  #check that doc is a document container
  if (!inherits(doc, "document_container")) {
    stop("`doc` must be a document_container object")
  }

  #check that there are snippets to write
  if (length(doc$snippets) == 0) {
    stop("No snippets to write. Add snippets with add_snippet() first")
  }

  #create the output folder if it doesn't exist
  if (!dir.exists(doc$path)) {
    dir.create(doc$path, recursive = TRUE)
  }

  #write each snippet to a .tex file
  for (name in names(doc$snippets)) {
    filepath <- file.path(doc$path, paste0(name, ".tex"))
    writeLines(doc$snippets[[name]]$code, filepath)
    cat("Written:", filepath, "\n")
  }

  invisible(doc)
}
