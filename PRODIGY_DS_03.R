# PRODIGY_DS_03

# Import the data set

bank <- read.csv("C:\\Users\\PREET PAUL\\Desktop\\Presidency University M.Sc. Notes\\Prodigy Infotech\\bank.csv",sep=";")
View(bank)
dim(bank)  # dimension  of the data set

# Checking for any missing values in the dataset

which(is.na(bank))

# Partitioning the data set into training set (80%) & testing set (20%)

set.seed(100)

indexSet <- sample(2, nrow(bank), replace=TRUE, prob = c(0.8,0.2))
train <- bank[indexSet==1, ]
test <- bank[indexSet==2, ]

dim(train)  # dimension of the training set
dim(test)   # dimension of the testing set

# Loading the packages "rpart" and "rpart.plot"

library(rpart)
library(rpart.plot)

# Build a Classification tree

help("rpart")

bank_classification_tree <- rpart(y ~ ., data = train, method = "class")
bank_classification_tree

## Visualizing the Classification tree Using rpart.plot()

help("rpart.plot")
rpart.plot(bank_classification_tree)
rpart.plot(bank_classification_tree, extra = 104)

# Prediction of Purchasing or not using training data set

train_prediction <- predict(bank_classification_tree, data = train, type = "class")
train_prediction

# Creating a Confusion Matrix

tab1 <- table(Predicted = train_prediction, Actual = train$y)
tab1

## Loading the packages "caret" & "e1071"

library(caret)
library(e1071)

## Confusion Matrix

confusion1 <- confusionMatrix(tab1)
confusion1

# Prediction of Purchasing or not on the testing data set

test_prediction <- predict(bank_classification_tree, newdata = test, type = "class")
test_prediction

# Creating a Confusion Matrix for the testing data set

tab2 <- table(Predicted = test_prediction, Actual = test$y)
tab2

## Confusion Matrix

confusion2 <- confusionMatrix(tab2)
confusion2




























