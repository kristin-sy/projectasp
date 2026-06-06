test_that("specialcharacters percent sign", {
  expect_equal(specialcharacters("50%"), "50\\%")
})

test_that("specialcharacters and", {
  expect_equal(specialcharacters("a & b"), "a \\& b")
})

test_that("specialcharacters underscore", {
  expect_equal(specialcharacters("p_value"), "p\\_value")
})

test_that("specialcharacters dollar sign", {
  expect_equal(specialcharacters("$100"), "\\$100")
})

test_that("specialcharacters leaves normal text unchanged", {
  expect_equal(specialcharacters("hello world"), "hello world")
})

test_that("specialcharacters handles NA", {
  expect_true(is.na(specialcharacters(NA)))
})
