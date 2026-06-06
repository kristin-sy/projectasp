test_that("rtolatex.numeric produces a newcommand", {
  result <- rtolatex(0.94, name = "accuracy", digits = 2)
  expect_true(grepl("\\\\newcommand", result$code))
})

test_that("rtolatex.numeric rounds correctly", {
  result <- rtolatex(0.9387, name = "accuracy", digits = 2)
  expect_true(grepl("0.94", result$code))
})

test_that("rtolatex.numeric returns a latex_snippet", {
  result <- rtolatex(0.94, name = "accuracy")
  expect_s3_class(result, "latex_snippet")
})

test_that("rtolatex.numeric throws error without name", {
  expect_error(rtolatex(0.94))
})

test_that("rtolatex.numeric throws error for vectors", {
  expect_error(rtolatex(c(0.94, 0.87), name = "accuracy"))
})
