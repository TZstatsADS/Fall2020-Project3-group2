###########################################################
### Train a classification model with training features ###
###########################################################

train.xgb <- function(train_data, nrounds = 100, max_depth = 6){
  
  model <- xgb.train(data = train_data,
                     nrounds = nrounds, 
                     eval_metric = list("error","auc"),
                     max_depth = max_depth, 
                     eta = 0.3, 
                     alpha = 0.03,
                     objective = "binary:logistic")

  return(model)
}

