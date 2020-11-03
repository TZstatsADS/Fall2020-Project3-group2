###########################################################
#KNN Classification #######################################
###########################################################

train_KNN <- function(train, test, labels, k = 1){
  model <- knn(train, test, labels, k = k, prob = F)
  return(model)
}