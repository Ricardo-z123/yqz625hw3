## Overview

`forward_select()` is a function developed in the R package `fwdreg` that implements the forward selection technique for building linear regression models. This function simplifies the process of model selection by sequentially adding predictors that minimize the Akaike Information Criterion (AIC).This method helps in identifying the most relevant variables, minimizing overfitting, and enhancing the predictive accuracy of the model.

- Learn more about how to use `forward_select` in the detailed vignette: `vignette("Introduction",package="fwdreg")`.
- Compare `forward_select` with the traditional `stepAIC` function and see performance benchmarks in the `vignette("Comparison", package="fwdreg")`.
- For examples of `forward_select` in action, check the help page: `?forward_select`.

## Features

The `forward_select()` function from the `fwdreg` package offers a robust method for performing forward selection in linear regression analysis. Here are the key features provided by this function:

- **Regression Coefficients**: Identifies and provides the coefficients of the most statistically significant predictors in a linear model.
- **Statistical Measures**: Outputs standard errors, t-values, and p-values for each selected predictor, aiding in the assessment of their statistical significance.
- **Model Metrics**: Includes essential metrics such as R-squared, Adjusted R-squared, and F-statistic to help evaluate the model's explanatory power and overall fit.
- **Residuals Summary**: Displays a detailed summary of residuals to help diagnose potential issues in model assumptions.
- **Confidence Intervals**: Provides confidence intervals for all regression coefficients, offering insights into the precision and reliability of the estimates.

## Installation

To ensure that the `fwdreg` package can be installed without any issues, follow these installation instructions:

```r
# Check if the devtools package is installed and load it
install.packages("devtools")

# Install fwdreg from GitHub
devtools::install_github("Ricardo-z123/yqz625hw3")

## Usage

``` r
library(fwdreg)
data=mtcars
model <- forward_select(mtcars, mpg)
print(summary(model))

#> Call:
#> lm(formula = current_formula, data = data)

#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -3.9290 -1.5598 -0.5311  1.1850  5.8986 

#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)    
#> (Intercept) 38.75179    1.78686  21.687  < 2e-16 ***
#> wt          -3.16697    0.74058  -4.276 0.000199 ***
#> cyl         -0.94162    0.55092  -1.709 0.098480 .  
#> hp          -0.01804    0.01188  -1.519 0.140015    
#> ---
#> Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#> Residual standard error: 2.512 on 28 degrees of freedom
#> Multiple R-squared:  0.8431,	Adjusted R-squared:  0.8263 
#> F-statistic: 50.17 on 3 and 28 DF,  p-value: 2.184e-11  
```
