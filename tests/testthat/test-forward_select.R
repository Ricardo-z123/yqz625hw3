library(fwdreg)
library(MASS)
library(testthat)
test_that("forward_select and stepAIC produce similar results", {
  data(mtcars)
  result_fwd <- forward_select(mtcars, mpg)

  # setting stepAIC  with same initial model and range
  initial_model <- lm(mpg ~ 1, data = mtcars)
  result_step <- stepAIC(initial_model, scope = list(lower = ~1, upper = ~ wt + cyl + hp + qsec + drat + am), direction = "forward", trace = FALSE)

  # compare two models' coefficients
  expect_true(all.equal(coef(result_fwd), coef(result_step), tolerance = 0.1), "Coefficients should be similar")

  # compare two models' Adjusted R
  expect_true(abs(summary(result_fwd)$adj.r.squared - summary(result_step)$adj.r.squared) < 0.05, "Adjusted R-squared should be close")
})
