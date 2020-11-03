########################################
### Classification with testing data ###
########################################

test_gbm <- function(gbm.fit.model, input.test, n){
  
  ### Input: 
  ###  - gbm.fit.model: the fitted GBM model using training data
  ###  - input.test: processed features from testing images
  ###  - n: number of trees
  ### Output: testing model performance
  
  ### Make predictions
  pred <- predict.gbm(object = gbm.fit.model,
                      newdata = input.test,
                      n.trees = n,
                      type = "response")
  
  labels = colnames(pred)[apply(pred, 1, which.max)]
  
  return(labels)
}