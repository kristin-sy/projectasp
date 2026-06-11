test_that("pvalue formats small p-values correctly", {
  expect_equal(pvalue(0.00001), "< 0.001")
})

test_that("pvalue formats normal p-values correctly", {
  expect_equal(pvalue(0.019), "= 0.019")
})

test_that("pvalue rounds to 3 decimal places", {
  expect_equal(pvalue(0.1), "= 0.100")
})

test_that("pvalue throws error for non-numeric input", {
  expect_error(pvalue("word"))
})

test_that("pvalue throws error for values outside 0 and 1", {
  expect_error(pvalue(1.1))
  expect_error(pvalue(-0.1))
})
