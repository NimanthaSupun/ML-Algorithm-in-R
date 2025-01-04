
library(e1071)
library(class)
library(caTools)


split <- sample.split(iris,SplitRatio = 0.7)
train <- subset(iris,split==TRUE)
test <- subset(iris,split==FALSE)


train_scale <- scale(train[,1:4])
test_scale <- scale(test[,1:4])

classifier_knn <- knn(train = train_scale,
                      test = test_scale,
                      cl=train$Species,
                      k=1)

classifier_knn

cm <- table(test$Species,classifier_knn)
cm


# todo: --------------------------------explain--------------------------------------
# First, the code loads three libraries: e1071, class, and caTools. These libraries provide functions for machine learning algorithms, including KNN, and tools for data manipulation and splitting.

# The dataset is then split into training and testing sets using the sample.split() function from the caTools library. The SplitRatio parameter is set to 0.7, meaning 70% of the data is used for training and the remaining 30% for testing. The subset() function is used to create the train and test datasets based on the split.

# Next, the feature columns (the first four columns) of the training and testing datasets are scaled using the scale() function. Scaling standardizes the data, which is important for distance-based algorithms like KNN to ensure that all features contribute equally to the distance calculations.

# The knn() function from the class library is then used to perform the KNN classification. The function takes the scaled training data (train_scale), the scaled testing data (test_scale), the class labels of the training data (train$Species), and the number of neighbors to consider (k=1). The result, stored in classifier_knn, contains the predicted species for the test data.

# The table() function is used to create a confusion matrix (cm) by comparing the actual species of the test data (test$Species) with the predicted species (classifier_knn). The confusion matrix provides a summary of the classification performance, showing how many instances were correctly or incorrectly classified for each species.