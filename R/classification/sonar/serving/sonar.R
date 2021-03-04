library(methods)
library(randomForest)
library(caret)
library(mlbench)
library(doMC)

predict <- function(model,newdata=list()) {
  res <- stats::predict(model,newdata[["data"]])
  data.frame(res)
}
send_feedback.sonar <- function(sonar,request=list(),reward=1,truth=list()) {
}
