# 🚀 Logistic Regression and Naive Bayes Classification in R

This repository contains R scripts for performing logistic regression and Naive Bayes classification on various datasets. The scripts demonstrate data loading, visualization, model training, prediction, and evaluation.

## 🗃️ Files

- `logistic_regression.r`: This script performs logistic regression on two datasets: `admissions.csv` and `diabetesmodel.csv`.
- `kmean_algorithm.r`: This script performs k-means clustering on the Iris dataset.
- `naive_bayes.r`: This script performs Naive Bayes classification on the `golf_df.csv` dataset.

## Dependencies

The scripts require the following R packages:
- `ggplot2`
- `caTools`
- `e1071`
- `class`

You can install these packages using the following commands:
```r
install.packages("ggplot2")
install.packages("caTools")
install.packages("e1071")
install.packages("class")
```

## Usage

### Logistic Regression

The `logistic_regression.r` script demonstrates logistic regression on two datasets:

1. **Admissions Dataset (`admissions.csv`)**
   - Visualizes the relationship between GPA and admission status.
   - Trains a logistic regression model to predict admission status based on GPA and rank.
   - Evaluates the model using a confusion matrix and calculates accuracy.

2. **Diabetes Dataset (`diabetesmodel.csv`)**
   - Visualizes the relationship between glucose levels and diabetes outcomes.
   - Trains a logistic regression model to predict diabetes outcomes based on various health metrics.
   - Evaluates the model using a confusion matrix and calculates accuracy.

### K-Means Clustering

The `kmean_algorithm.r` script performs k-means clustering on the Iris dataset:
- Loads the Iris dataset and applies k-means clustering with 3 clusters.
- Visualizes the clustering results and compares them with the actual species classification.

### Naive Bayes Classification

The `naive_bayes.r` script demonstrates Naive Bayes classification on the `golf_df.csv` dataset:
- Loads the dataset and trains a Naive Bayes model to predict the target variable based on the first four columns.
- Evaluates the model using a confusion matrix and makes predictions on new data.

## Example

To run the logistic regression script, use the following command in R:
```r
source("logistic_regression.r")
```

To run the k-means clustering script, use the following command in R:
```r
source("kmean_algorithm.r")
```

To run the Naive Bayes classification script, use the following command in R:
```r
source("naive_bayes.r")
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
