# Credit-Risk-Classification-Decision-Tree
Machine learning classification model built in R to predict credit card defaults and minimize banking risk.

Project Overview

This repository contains an R-based machine learning project aimed at predicting credit card defaults. By evaluating client demographic and historical payment data, this project models credit risk using the C5.0/CART decision tree algorithm (rpart). The decision tree's performance is then evaluated against a baseline k-Nearest Neighbors (k-NN) model to determine the most effective algorithm for minimizing financial risk.

Key Features & Methodology

Data Preparation: Cleaned and formatted integer-based categorical variables (e.g., education, repayment status) as factors to ensure logical processing by the algorithm.

Stratified Partitioning: Utilized the caret package (createDataPartition) to create a balanced 80/20 training and test split, ensuring an accurate representation of defaults in both sets.

Model Evaluation: Leveraged caret::confusionMatrix to extract Accuracy, Precision, Recall (Sensitivity), and F1-scores.

Business-Centric Optimization: Focused analysis on minimizing False Negatives (predicting a customer will not default when they actually do), as this represents the highest direct financial cost to a banking institution.

Key Findings

Feature Importance: The algorithm identified PAY_0 (the customer's repayment status in the most recent month) as the single most critical predictor of default. The predictive power of this variable was so strong that the model relied on it as the sole feature for the tree's split, making the model highly interpretable without any need for complexity pruning.

Overfitting: No overfitting was observed. The training and test accuracies remained nearly identical at roughly 82%.

Model Comparison:

Decision Tree: Accuracy: 81.98% | Precision: 70.36% | Recall: 32.02% | F1: 44.01%

k-NN (k=15): Accuracy: 81.48% | Precision: 65.69% | Recall: 34.06% | F1: 44.86%

Recommendation: While both models performed similarly, the k-NN model is recommended for this specific banking task. It achieved a slightly higher recall score, resulting in fewer false negatives (875 for k-NN vs. 902 for the Decision Tree). In a real-world financial context, this reduction in false negatives directly translates to fewer bad loans approved, saving the institution money.

Technologies Used

Language: R

Libraries: rpart (Decision Tree Modeling), rpart.plot (Visualization), caret (Data Partitioning and Confusion Matrix Analytics), gmodels

How to Run

Ensure R and RStudio are installed.

Clone this repository.

Install required packages in R: install.packages(c("rpart", "rpart.plot", "caret", "gmodels"))

Set your working directory to the folder containing credit_default.csv.

Run the provided .R script to generate the models, visualize the decision tree, and output the confusion matrix statistics.
