test_that("rtolatex.numeric produces a command", {
  result <- rtolatex(0.94, name = "accuracy", digits = 2)
  expect_true(grepl("\\\\newcommand", result$code))
})

test_that("rtolatex.numeric rounds correctly", {
  result <- rtolatex(0.9389, name = "accuracy", digits = 2)
  expect_true(grepl("0.94", result$code))
})

test_that("rtolatex.numeric returns a latex snippet", {
  result <- rtolatex(0.94, name = "accuracy")
  expect_s3_class(result, "latex_snippet")
})

test_that("rtolatex.numeric shows error for objects without name", {
  expect_error(rtolatex(0.94))
})

test_that("rtolatex.numeric shows error for vectors", {
  expect_error(rtolatex(c(0.94, 0.92), name = "accuracy"))
})
