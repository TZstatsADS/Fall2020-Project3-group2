###########################################################
### Train a classification model with training features ###
###########################################################
library(gbm)

train_gbm <- function(train_data, s, K = 5, n){
  ### Train a GBM model with K fold cross validation and n number of tress
  
  ### Input:
  ### - train_data: a data frame containing features and labels
  ### - s: shrinkage parameter
  ### - K: number of cv.folds
  ### - n: number of trees
  ### Output: trained gbm baseline model
  
  gbm.fit.model<- gbm(label~. ,data = train_data,
                distribution = "multinomial", 
                n.trees = n,
                shrinkage = s,
                n.minobsinnode = 10, 
                cv.folds = K)
  
  return(gbm.fit.model)
}