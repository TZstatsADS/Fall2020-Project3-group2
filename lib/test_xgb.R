###########################################################
### Make predictions with test features ###
###########################################################

test.xgb <- function(model, test_data){
  prob_pred <- predict(model, test_data)
  prediction <- as.numeric(prob_pred > 0.5)
  return(list(prob_pred = prob_pred, prediction = prediction))
}





