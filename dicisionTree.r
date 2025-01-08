
library(rpart)
library(rpart.plot)
library(caTools)


dataset <- as.data.frame(Titanic)
dataset$Survived <- as.factor(dataset$Survived)

split <- sample.split(dataset,SplitRatio = 0.7)
train <- subset(dataset,split==TRUE)
test <- subset(dataset,split==FALSE)

tree <- rpart(Survived ~., train,method = "class")

summary(tree)

r=rpart.plot(tree)
prp(tree,extra = 3)

# In this code, the rpart function is used to build a classification tree. The formula Survived ~ . specifies that the model should predict the Survived variable using all other variables in the train dataset as predictors. The Survived variable is typically a binary outcome, such as whether a passenger survived or not in the Titanic dataset.

# The train parameter indicates that the model should be trained using the data contained in the train dataset. This dataset should include both the predictor variables and the target variable (Survived).

# The method = "class" argument specifies that the decision tree should be built for a classification task. This means that the target variable (Survived) is categorical, and the goal is to classify each observation into one of the categories based on the predictor variables.