test_that("specialcharacters percentage", {
  expect_equal(specialcharacters("50%"), "50\\%")
})

test_that("specialcharacters and", {
  expect_equal(specialcharacters("a & b"), "a \\& b")
})

test_that("specialcharacters underscore", {
  expect_equal(specialcharacters("p_value"), "p\\_value")
})

test_that("specialcharacters euro sign", {
  expect_equal(specialcharacters("$100"), "\\$100")
})

test_that("specialcharacters leaves normal text the same", {
  expect_equal(specialcharacters("hello world"), "hello world")
})

test_that("specialcharacters handles NA", {
  expect_true(is.na(specialcharacters(NA)))
})
