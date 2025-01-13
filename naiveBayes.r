
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

# First, the code reads the dataset from a CSV file using the read.csv() function and assigns it to the variable dataset. The View() function is then used to display the dataset in a spreadsheet-like format, allowing for visual inspection. The head() and tail() functions are used to display the first and last few rows of the dataset, respectively, providing a quick overview of the data. The summary() function generates summary statistics for each column in the dataset, giving insights into the distribution and characteristics of the data.

# Next, the e1071 library is loaded, which contains the implementation of the Naive Bayes algorithm. The naiveBayes() function is used to create a Naive Bayes model. The function takes two arguments: the predictor variables (the first four columns of the dataset) and the target variable (the fifth column of the dataset). The resulting model is stored in the variable model.

# The table() function is then used to create a confusion matrix, which compares the predicted values from the model with the actual values in the dataset. The predict() function generates predictions for the dataset (excluding the target variable), and the confusion matrix provides a summary of the model's performance by showing how many instances were correctly or incorrectly classified.

# The code then demonstrates how to use the trained model to make predictions on new data. A new observation is created with specific weather conditions (Sunny outlook, Cool temperature, High humidity, and Strong wind) and is assigned to the 15th row of the dataset, excluding the target variable. The predict() function is used again to predict the class for this new observation based on the trained model. The result of this prediction is stored in the variable result and printed out.