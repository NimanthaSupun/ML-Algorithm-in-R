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


# First, the code reads the dataset into a variable named data using the read.csv() function and displays it using the View() function. A scatter plot is created using ggplot2 to visualize the relationship between glucose levels and diabetes outcomes, with the geom_jitter() function adding some random noise to the points for better visualization. The sum(is.na(data)) function checks for any missing values in the dataset.

# The dataset is then split into training and testing sets using the sample.split() function from the caTools library, with 80% of the data allocated to the training set and the remaining 20% to the testing set. The subset() function is used to create the training_data and testing_data datasets based on the split.

# A logistic regression model is trained using the glm() function, with the formula specifying that the Outcome variable (indicating diabetes presence) is predicted based on several predictor variables: Glucose, BMI, Pregnancies, BloodPressure, SkinThickness, Insulin, and Age. The family = "binomial" argument indicates that this is a logistic regression model. The model is trained on the training_data and the summary of the model is printed using the summary() function.

# Predictions are made on the test set using the predict() function, with the type = "response" argument specifying that the output should be predicted probabilities. These probabilities are then converted to class labels ("diabetes" or "no diabetes") using the ifelse() function, with a threshold of 0.5.

# The head() function is used to display the first few predicted class labels. A confusion matrix is created using the table() function to compare the actual outcomes in the test set with the predicted class labels. The confusion matrix is printed, and the accuracy of the model is calculated by summing the diagonal elements of the confusion matrix (correct predictions) and dividing by the total number of predictions. The accuracy is then printed.

