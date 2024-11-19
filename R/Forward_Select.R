
#' @title Forward Selection in Linear Regression
#' @description This function implements a forward selection algorithm to build
#'     a linear regression model by sequentially adding predictors that minimize the AIC.
#'
#' @param data The data set containing the variables.
#' @param response The response variable in the model.
#'
#' @return a fitted linear model
#' @export
#'
#' @examples
#' data(mtcars)
#' model <- forward_select(mtcars, mpg)
#' summary(model)
#'
#'
forward_select <- function(data, response){
  response_y <- deparse(substitute(response))
  predictors <- setdiff(names(data), response_y)

  # initialize the linear model, only with intercept
  current_formula <- as.formula(paste(response_y, "~1"))
  current_lm <- lm(current_formula, data = data)
  min_AIC <- AIC(current_lm)

  # define function to calculate linear model AIC
  lm_AIC <- function(predictor, current_formula, data){
    update_formula <- update(current_formula, paste(".~ . +", predictor))
    model <- lm(update_formula, data = data)
    return(AIC(model))
  }

  # choose predictors and store each AIC
  add <- TRUE
  while(add && length(predictors) > 0){
    predictor_AIC <- sapply(predictors, lm_AIC, current_formula = current_formula, data = data)

    # find the minimal AIC and add corresponding predictors to the model
    min_pred_AIC <- min(predictor_AIC)
    if (min_pred_AIC < min_AIC){
      add_predictor <- names(which.min(predictor_AIC))
      current_formula <- update(current_formula, paste(".~ . +", add_predictor))
      current_lm <- lm(current_formula, data = data)

      min_AIC <- min_pred_AIC
      predictors <- setdiff(predictors, add_predictor)
    } else {
      add <- FALSE
    }
  }

  return(current_lm)
}
