
dataset<-read.csv("golf_df.csv")
View(dataset)
head(dataset)
tail(dataset)
summary(dataset)
library(e1071)
model<-naiveBayes(dataset[,1:4],dataset[,5])
table(predict(model,dataset[-5]),dataset[,5],dnn=list("predicted","actual"))
#new data

dataset[15,-5]<-as.factor(c(Outlook="Sunny",Temperature="Cool",Humidity="High",Wind="Strong")) 
result<-predict(model,dataset[15,-5])
result