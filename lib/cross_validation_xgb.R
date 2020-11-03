########################
### Cross Validation ###
########################

### Author: Minzhi Zhang
### Project 3


cv.function.xgb <- function(data, K, reweight = FALSE, smote = FALSE, nrounds_list, max_depth_list){
  ### Input:
  ### - data: training data
  ### - K: a number stands for K-fold CV
  ### - reweight: sample reweighting 
  ### - smote: oversampling using SMOTE method
  ### - nrounds_list: tuning parameters of XGB
  ### - max_depth_list: tuning parameters of XGB
  
  
  set.seed(2020)
  
  ## oversampling using SMOTE technique
  train_smote <- SMOTE(label ~ ., dat_train, perc.over = 200, k = 5, perc.under = 150)
  
  ## sample reweighting
  train_label <- as.numeric(levels(dat_train$label))[dat_train$label]
  test_label <- as.numeric(levels(dat_test$label))[dat_test$label]
  weight_train <- rep(NA, length(train_label))
  weight_test <- rep(NA, length(test_label))
  for (v in unique(train_label)){
    weight_train[train_label == v] = 0.5 * length(train_label) / length(train_label[train_label == v])
    weight_test[test_label == v] = 0.5 * length(test_label) / length(test_label[test_label == v])
  }
  
  
  ## cross validation function
  cv_train <- function(train_data) {
    p <- length(nrounds_list)
    q <- length(max_depth_list)
    cv_error <- matrix(0, p, q)
    cv_auc <- matrix(0, p, q)
    
    i = 1
    for (nrounds in nrounds_list) {
      j = 1
      for (max_depth in max_depth_list) {
        cv <- xgb.cv(data = train_xgb,
                     nrounds = nrounds,
                     max_depth = max_depth,
                     nfold = K,
                     metrics = list("error","auc"),
                     eta = 0.3, 
                     alpha = 0.03,
                     objective = "binary:logistic",
                     verbose = 0)
        cv_error[i, j] <- as.numeric(cv$evaluation_log[nrounds, "test_error_mean"])
        cv_auc[i, j] <- as.numeric(cv$evaluation_log[nrounds, "test_auc_mean"])
        j = j + 1
      }
      i = i + 1
    }
    
    return(list(mean_error = cv_error, mean_AUC = cv_auc))
  }
  
  
  ## model training
  if (reweight){
    train_label <- as.numeric(levels(dat_train$label))[dat_train$label]
    train_xgb <- xgb.DMatrix(as.matrix(dat_train[, -6007]),
                             label = train_label,
                             weight = weight_train)
    model_train <- cv_train(train_xgb)
  } else if (smote) {
    train_label <- as.numeric(levels(train_smote$label))[train_smote$label]
    train_xgb <- xgb.DMatrix(as.matrix(train_smote[, -6007]), label = train_label)
    model_train <- cv_train(train_xgb)
  } else {
    train_label <- as.numeric(levels(dat_train$label))[dat_train$label]
    train_xgb <- xgb.DMatrix(as.matrix(dat_train[, -6007]), label = train_label)
    model_train <- cv_train(train_xgb)
  }
  
  return(model_train)
}


