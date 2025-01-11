data<-read.csv("/Users/diluka/Desktop/admissions.csv")
View(data)
library(ggplot2)

ggplot(data,aes(x=gpa,y=admitted))+geom_jitter(height=.05,alpha=.1)

#creating logistic model
#generalized leaner model
model<-glm(admitted ~ gpa, data = data,family = "binomial")
summary(model)

ggplot(data,aes(x=gpa,y=admitted),)+
  geom_jitter(height=.05,alpha=.1)+
  geom_smooth(method = 'glm',method.args=list(family="binomial"))

#split data
library(caTools)
data2<-read.csv("/Users/diluka/Desktop/admission_p.csv")
View(data2)
split<-sample.split(data2,SplitRatio=0.8)

# Create the training set
training_data <- subset(data2, split == TRUE)

# Create the testing set
testing_data <- subset(data2, split == FALSE)

#train model
lg_model<-glm(admit ~ gpa+rank, data = data2,family = "binomial")
summary(lg_model)

# Make predictions on the test set
predictions <- predict(lg_model, newdata = testing_data, type = "response")
predictions

# Convert predicted probabilities to class labels
predicted_classes <- ifelse(predictions > 0.5, "admiited", "not admiited")

head(predicted_classes)

conf_matrix <- table(testing_data$admit, predicted_classes)
print(conf_matrix)
sum(diag(conf_matrix))
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
print(paste("Accuracy:", accuracy))

###############

data<-read.csv("/Users/diluka/Desktop/diabetesmodel.csv")
View(data)
ggplot(data,aes(x=Glucose,y=Outcome))+geom_jitter(height=.05,alpha=.1)
sum(is.na(data))

split<-sample.split(data,SplitRatio=0.8)

# Create the training set
training_data <- subset(data, split == TRUE)

# Create the testing set
testing_data <- subset(data, split == FALSE)

#train model
lg_model<-glm(Outcome ~ Glucose+BMI+Pregnancies+BloodPressure+SkinThickness+Insulin+
                Age, data = training_data,family = "binomial")
summary(lg_model)

# Make predictions on the test set
predictions <- predict(lg_model, newdata = testing_data, type = "response")
predictions

# Convert predicted probabilities to class labels
predicted_classes <- ifelse(predictions > 0.5, "diabetes", "no diabetes")

head(predicted_classes)

conf_matrix <- table(testing_data$Outcome, predicted_classes)
print(conf_matrix)
sum(diag(conf_matrix))
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
print(paste("Accuracy:", accuracy))




