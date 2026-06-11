#' add a snippet to a document container
#'
#' inserts a latex snippet into the document container
#'
#' @param doc the document container
#' @param snippet the snippet from rtolatex().
#' @param name name of the snippet
#' @param ... ignored only for syntax
#'
#' @return the document container with updates
#' @export
#'
#' @examples
#' doc <- document_container()
#' doc <- add_snippet(doc, rtolatex(0.94, name = "accuracy"), "accuracy")
add_snippet <- function(doc, snippet, name, ...) {
  #check that doc is the container
  if (!inherits(doc, "document_container")) {
    stop("`doc` must be a document container object")
  }

  #check that snippet is a part of the snippets
  if (!inherits(snippet, "latex_snippet")) {
    stop("`snippet` must be a latex snippet object from rtolatex()")
  }

  #name checks
  if (missing(name)) {
    stop("provide a `name` for the snippet")
  }

  #add the snippet to the container
  doc$snippets[[name]] <- snippet

  #printing the updated container
  doc
}
