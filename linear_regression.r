data<-read.csv("/Users/diluka/Desktop/Salary_Data.csv")
data
#summary of data
summary(data)
colnames(data)
#identifying the relationship
plot(data$YearsExperience,data$Salary,pch=16,col='blue',
     main="Experience vs Salary",xlab='Experience',ylab = 'Salary')

abline(model)
#splitting the data into training and test data
#seting random values


set.seed(2)
library(caTools)
split<-sample.split(data,SplitRatio=0.7)
split

train<-subset(data,split="TRUE")
test<-subset(data,split="FALSE")

#create the model
model<-lm(Salary~.,data=train)
summary(model)


#prediction (comes form ca tools)
prediction<-predict(model,test)
prediction

#comparing predicted vs actual values
plot(test$Salary,type = "l",lty=1.8,col="red")
lines(prediction,type="l",col="blue")

#finding accuracy
rmse<-sqrt(mean(prediction-data$Salary)^2)
rmse

# Function to predict salary for new data
predict_new_salary <- function(new_experience) {
  new_data <- data.frame(YearsExperience = new_experience)
  predicted_salary <- predict(model, newdata = new_data)
  return(predicted_salary)
}

# Test prediction with new data
new_experience <- 5  # Example: 5 years of experience
predicted_salary <- predict_new_salary(new_experience)
print(paste("Predicted Salary for", new_experience, "years of experience:", predicted_salary))


