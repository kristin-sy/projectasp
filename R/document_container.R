#' creating a latex document container for all snippets
#'
#' creates empty containers to store all latex snippets
#' use add_snippet() to add snippets
#' use write_tex() to save as files
#'
#' @param path folder where all snippets are stored
#'
#' @return a document container
#' @export
#'
#' @examples
#' doc <- document_container()
#' doc <- document_container("my_outputs")
document_container <- function(path = "outputs") {
  # Create the object as a list with the path and an empty snippets list
  structure(
    list(path = path,
      snippets = list()
    ),
    class = "document_container"
  )
}

#' printing document container
#'
#' @param x the document container
#' @param ... ignored only for syntax
#' @export
print.document_container <- function(x, ...) {
  cat("<document_container>\n")
  cat("Output folder:", x$path, "\n")
  cat("Snippets:", length(x$snippets), "\n")
  if (length(x$snippets) > 0) {
    cat("  -", paste(names(x$snippets), collapse = "\n  - "), "\n")
  }
  invisible(x)
}
