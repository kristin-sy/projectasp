test_that("write_textfile creates output folder if it doesn't exist", {
  doc <- document_container(path = "test_outputs")
  doc <- add_snippet(doc, rtolatex(0.94, name = "accuracy"), "accuracy")
  write_textfile(doc)
  expect_true(dir.exists("test_outputs"))
  # Clean up
  unlink("test_outputs", recursive = TRUE)
})

test_that("write_textfile creates a .tex file", {
  doc <- document_container(path = "test_outputs")
  doc <- add_snippet(doc, rtolatex(0.94, name = "accuracy"), "accuracy")
  write_textfile(doc)
  expect_true(file.exists("test_outputs/accuracy.tex"))
  # Clean up
  unlink("test_outputs", recursive = TRUE)
})

test_that("write_textfile throws error for empty container", {
  doc <- document_container()
  expect_error(write_textfile(doc))
})

test_that("write_textfile throws error for wrong input", {
  expect_error(write_textfile("not a container"))
})
