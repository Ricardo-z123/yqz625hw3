## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(fwdreg)
data = mtcars
model <- forward_select(mtcars, mpg)
summary(model)

