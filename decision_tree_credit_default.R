#importing the csv file
#looking at the structure of the data frame
credit<- read.csv("credit_default.csv")
str(credit)

#selecting specific columns into edited data frame
credit_edit <- credit[, c("LIMIT_BAL", "AGE", "EDUCATION", "PAY_0", "PAY_2",
                                    "BILL_AMT1","default_payment_next_month")]

#converting default_payment_next_month to factor
credit_edit$default_payment_next_month <- as.factor(credit_edit$default_payment_next_month)

#converting EDUCATION to factor
credit_edit$EDUCATION <- as.factor(credit_edit$EDUCATION)

#converting PAY_0 to factor
credit_edit$PAY_0 <- as.factor(credit_edit$PAY_0)

#converting PAY_ to factor
credit_edit$PAY_2 <- as.factor(credit_edit$PAY_2)

#checking for missing values
anyNA(credit_edit)

#checking the structure of the data frame
str(credit_edit)

#Shuffling and splitting the data
set.seed(25)

#creating a sample
train_sample <- createDataPartition(credit_edit$default_payment_next_month, 
                                   p = 0.80, 
                                   list = FALSE)

#split the data frames
credit_train <- credit_edit[train_sample,]
credit_test <- credit_edit[-train_sample,]

#check the proportion of class variable
prop.table(table(credit_train$default))
prop.table(table(credit_test$default))

#ensuring the target variable is in both sets
str(credit_train)
str(credit_test)

#building the decision tree model
credit_tree <- rpart(default_payment_next_month ~ ., data = credit_train, method = "class")

#Visualizing the tree
rpart.plot(credit_tree, type = 2, extra = 104)

#predicting on the test set 
credit_test_pred <-predict(credit_tree, newdata = credit_test, type = "class")

#generating a confusion matrix
confusionMatrix(data = credit_test_pred,
                reference = credit_test$default_payment_next_month,
                positive = "1",
                mode = "everything")

#examining the complexity parameter of the tree
printcp(credit_tree)
plotcp(credit_tree)
#no pruning is necessary

#predicting on the training set to compare the numbers
credit_train_pred <-predict(credit_tree2, newdata = credit_train, type = "class")

#generating a confusion matrix
confusionMatrix(data = credit_train_pred,
                reference = credit_train$default_payment_next_month,
                positive = "1",
                mode = "everything")

#building a tree with the testing data set
#building the decision tree model
credit_tree2 <- rpart(default_payment_next_month ~ ., data = credit_test, method = "class")

#Visualizing the tree
rpart.plot(credit_tree2, type = 2, extra = 104)
