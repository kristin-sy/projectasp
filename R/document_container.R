#validator
validate_document_container <- function(x){
  if (!is.character(x$path) || length(x$path) != 1) {
    stop("`path` must be a single character string")
  }
  if (!is.list(x$snippets)) {
    stop("`snippets` must be a list")
  }
  x
}

#constructor for document container
new_document_container <- function(path = character(), snippets = list()) {
  structure(
    list(path = path, snippets = snippets),
    class = "document_container"
  )
}

#' creating a latex document container for all snippets
#'
#' creates empty containers to store all latex snippets
#' use add_snippet() to add snippets
#' use write_textfile() to save as files
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
  # calling validator and constructor
  x <- new_document_container(
    path = as.character(path), #helper function
    snippets = list()
  )
  validate_document_container(x)
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
