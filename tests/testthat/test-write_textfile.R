test_that("write_textfile creates output folder if it doesn't exist", {
  doc <- document_container(path = "test_outputs")
  doc <- add_snippet(doc, rtolatex(0.94, name = "accuracy"), "accuracy")
  write_textfile(doc)
  expect_true(dir.exists("test_outputs"))
  unlink("test_outputs", recursive = TRUE)
})

test_that("write_textfile creates a .tex file", {
  doc <- document_container(path = "test_outputs")
  doc <- add_snippet(doc, rtolatex(0.94, name = "accuracy"), "accuracy")
  write_textfile(doc)
  expect_true(file.exists("test_outputs/accuracy.tex"))
  unlink("test_outputs", recursive = TRUE)
})

test_that("write_textfile shows error for empty container", { #when forgetting to insert snippets
  doc <- document_container()
  expect_error(write_textfile(doc))
})

test_that("write_textfile shows error for wrong input", { #wrong type of snippets
  expect_error(write_textfile("not a container"))
})
