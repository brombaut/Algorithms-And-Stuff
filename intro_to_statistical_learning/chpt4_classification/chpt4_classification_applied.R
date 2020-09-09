rm(list=ls())
library(ISLR)

## 10
# a) Produce some numberical and graphical summaries of the Weekly data.
# Do there appear to be any patterns?
summary(Weekly)
pairs(Weekly)
cor(Weekly[, -9])
# Year and volumen appear to be related. Nothing else stands out
# b) Use the full data set to perform a logistic regression with Direstion as the response 
# and the five lag variables plus Volume as predictos. Use the summary function to print the results.
# Do any of the predictors appear to be statistically significant? If so, which ones?
attach(Weekly)
glm.fit = glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data=Weekly, family=binomial)
summary(glm.fit)
# Lag2 has a p-value of around 0.03
# c) Compute the confusion matrix and overall fraction of correct predictions. Explain what the confusion 
# matrix is telling you about the types of mistakes made by logistic regression.
glm.probs = predict(glm.fit, type = "response")
glm.pred = rep("Down", length(glm.probs))
glm.pred[glm.probs > 0.5] = "Up"
table(glm.pred, Direction)
# Percentage of correct predictions: (54+557)/(54+557+48+430) = 56.1%. 
# Weeks the market goes up the logistic regression is right most of the time, 557/(557+48) = 92.1%. 
# Weeks the market goes up the logistic regression is wrong most of the time 54/(430+54) = 11.2%.
# d) Now fit the logistic regression model using a training data period from 1990 to 2008,
# with Lag2 as the only predictor. Compute the confusion matrix and the overall fraction of correct
# predictions for the held out data (i.e. the data from 2009 and 2010)
train = (Year < 2009)
Weekly.test = Weekly[!train, ]
glm.fit = glm(Direction ~ Lag2, data = Weekly, family = binomial, subset = train)
glm.probs = predict(glm.fit, Weekly.test, type = "response")
glm.pred = rep("Down", length(glm.probs))
glm.pred[glm.probs > 0.5] = "Up"
Direction.test = Direction[!train]
table(glm.pred, Direction.test)
mean(glm.pred == Direction.test)
# e) Repeat (d) using LDA.
library(MASS)
lda.fit = lda(Direction ~ Lag2, data = Weekly, subset = train)
lda.pred = predict(lda.fit, Weekly.test)
table(lda.pred$class, Direction.test)
mean(lda.pred$class == Direction.test)
# f) Repeat (d) using QDA.
qda.fit = qda(Direction ~ Lag2, data = Weekly, subset = train)
qda.class = predict(qda.fit, Weekly.test)$class
table(qda.class, Direction.test)
mean(qda.class == Direction.test)
# A correctness of 58.7% even though it picked Up the whole time!
# g) Repeat (d) using KNN with K=1
library(class)
train.X = as.matrix(Lag2[train])
test.X = as.matrix(Lag2[!train])
train.Direction = Direction[train]
set.seed(1)
knn.pred = knn(train.X, test.X, train.Direction, k = 1)
table(knn.pred, Direction.test)
mean(knn.pred == Direction.test)
# h) Which of these methods appears to provide the best results on this data?
# Logistic regression and LDA methods provide similar test error rates.
# i) Experiment with different combinations of predictors, including possible transformations
# and interactions, for each of the methods. Report the variables, method, and associated
# confusion matrix that appears to provide the best results on the held out data.
# Note that you should also experiment with values for K in the KNN classifier.
# 
# Logistic regression with Lag2:Lag1
glm.fit = glm(Direction ~ Lag2:Lag1, data = Weekly, family = binomial, subset = train)
glm.probs = predict(glm.fit, Weekly.test, type = "response")
glm.pred = rep("Down", length(glm.probs))
glm.pred[glm.probs > 0.5] = "Up"
Direction.test = Direction[!train]
table(glm.pred, Direction.test)
mean(glm.pred == Direction.test)
#
# LDA with Lag2 interaction with Lag1
lda.fit = lda(Direction ~ Lag2:Lag1, data = Weekly, subset = train)
lda.pred = predict(lda.fit, Weekly.test)
mean(lda.pred$class == Direction.test)
#
# QDA with sqrt(abs(Lag2))
qda.fit = qda(Direction ~ Lag2 + sqrt(abs(Lag2)), data = Weekly, subset = train)
qda.class = predict(qda.fit, Weekly.test)$class
table(qda.class, Direction.test)
mean(qda.class == Direction.test)
#
# KNN k =10
knn.pred = knn(train.X, test.X, train.Direction, k = 10)
table(knn.pred, Direction.test)
mean(knn.pred == Direction.test)
#
# KNN k = 100
knn.pred = knn(train.X, test.X, train.Direction, k = 100)
table(knn.pred, Direction.test)
mean(knn.pred == Direction.test)
# Out of these permutations, the original LDA and logistic regression have better performance 
# in terms of test error rate.

## 11
# In this problem, you will develop a model to predict whether a given car gets high
# or low gas mileage based on the Auto data set.
library(ISLR)
summary(Auto)
# a) Create a binary variable, mpg01, that contains a 1 if mpg contains a value above
# its median, and a 0 if mpg contains a value below its median. You can compute the 
# median using the median() function. Note you may find it helpful to use the data.drame()
# function to create a single data set containing both mpg01 and the other Auto variables
attach(Auto)
mpg01 = rep(0, length(mpg))
mpg01[mpg > median(mpg)] = 1
Auto = data.frame(Auto, mpg01)
# b) Explore the data graphically in order to investigate the association between mpg01 
# and the other features. Which of the other features seem most likely to be useful in 
# predicting mpg01? Scatterplots and boxplots may be useful tools to answer this question.
# Describe your findings.
cor(Auto[, -9])
pairs(Auto)  # doesn't work well since mpg01 is 0 or 1
# Anti-correlated with cylinders, weight, displacement, horsepower. (mpg, of course)
# c) Split the data into a training set and a test set.
train = (year%%2 == 0)  # if the year is even
test = !train
Auto.train = Auto[train, ]
Auto.test = Auto[test, ]
mpg01.test = mpg01[test]
# d) Perform LDA on the training data in order to predict mpg01 using the variables that seemed
# most associated with mpg01 in (b). What is the test error of the model obtained?
# LDA
library(MASS)
lda.fit = lda(mpg01 ~ cylinders + weight + displacement + horsepower, data=Auto, subset=train)
lda.pred = predict(lda.fit, Auto.test)
mean(lda.pred$class != mpg01.test)
# 12.6% test error rate.
# e) Perform QDA on the training data in order to predict mpg01 using the variables that seemed
# most associated with mpg01 in (b). What is the test error of the model obtained?
# QDA
qda.fit = qda(mpg01 ~ cylinders + weight + displacement + horsepower, data=Auto, subset=train)
qda.pred = predict(qda.fit, Auto.test)
mean(qda.pred$class != mpg01.test)
# 13.2% test error rate.
# f) Perform logistic regression on the training data in order to predict mpg01 using the 
# variables that seemed most associated with mpg01 in (b). What is the test error of 
# the model obtained?
# Logistic regression
glm.fit = glm(mpg01 ~ cylinders + weight + displacement + horsepower, data=Auto, family=binomial, subset=train)
glm.probs = predict(glm.fit, Auto.test, type = "response")
glm.pred = rep(0, length(glm.probs))
glm.pred[glm.probs > 0.5] = 1
mean(glm.pred != mpg01.test)
# 12.1% test error rate.
# f) Perform KNN on the training data in order to predict mpg01 using the 
# variables that seemed most associated with mpg01 in (b). What is the test error of 
# the model obtained? Which value of K seems to perform the best on this data set?
library(class)
train.X = cbind(cylinders, weight, displacement, horsepower)[train, ]
test.X = cbind(cylinders, weight, displacement, horsepower)[test, ]
train.mpg01 = mpg01[train]
set.seed(1)
# KNN(k=1)
knn.pred = knn(train.X, test.X, train.mpg01, k=1)
mean(knn.pred != mpg01.test)
# 15.4% test error rate
# KNN(k=10)
knn.pred = knn(train.X, test.X, train.mpg01, k = 10)
mean(knn.pred != mpg01.test)
# 16.5% test error rate
# KNN(k=100)
knn.pred = knn(train.X, test.X, train.mpg01, k = 100)
mean(knn.pred != mpg01.test)
# 14.3% test error rate
# K of 100 seems to perform the best. 100 nearest neighbors.

## 12
# a) Write a function, Power(), that prints out the result of raising 2 to the 3rd power.
Power = function() {
  print(2^3)
}
Power()
# b) Create a new function, Power2(), that allows you to pass any two numbers, x and a,
# and prints out the value of x^a.
Power2 = function(x, a) {
  print(x^a)
}
Power2(4, 3)
# c) Using Power2() function, compute 10^3, 8^17, 131^3.
Power2(10, 3)
Power2(8, 17)
Power2(131, 3)
# d) Now create a new function, Power3(), that actually returns the result x^a as an R object.
Power3 = function(x, a) {
  return(x^a)
}
x = Power3(3, 3)
# e) Now using Power3() function, create a plot f(x)=x^2.
# The x-axis should display a range of integers from 1 to 10, and the y-axis should display x^2.
# Label the axes appropriately, and use an appropriate title for the figure. Consider displaying
# either the x-axis, the y-axis, or both on the log-scale.
x = 1:10
plot(x, Power3(x, 2), log="xy", ylab="Log of y = x^2", xlab="Log of x", main="Log of x^2 versus Log of x")
# f) Create a function, PlotPower(), that allows you to create a plot of x against x^a for a 
# fixed a and for a range of values of x. For instance, if you call PlotPower(1:10,3) then 
# a plot should be created with an x-axis taking on values 1,2,...,10, and a y-axis on
# values 1^3, 2^3, ..., 10^3.
PlotPower = function(x, a) {
  plot(x, Power3(x, a))
}
PlotPower(1:10,3)

## 13
# Using the Boston data set, fit classification models in order to predict whether a given
# suburb has a crime rate above or below the median. Explore logistic regression, LDA, and KNN
# models using various subsets of the predictors. Describe your findings.
library(MASS)
summary(Boston)
attach(Boston)
View(Boston)
crime01 = rep(0, length(crim))
crime01[crim > median(crim)] = 1
Boston = data.frame(Boston, crime01)

train = 1:(dim(Boston)[1]/2)
test = (dim(Boston)[1]/2 + 1):dim(Boston)[1]
Boston.train = Boston[train,]
Boston.test = Boston[test, ]
crime01.test = crime01[test]

# logistic regression
glm.fit = glm(crime01~.-crime01-crim, data=Boston, family=binomial, subset=train)
glm.probs = predict(glm.fit, Boston.test, type="response")
glm.pred = rep(0, length(glm.probs))
glm.pred[glm.probs>0.5] = 1
mean(glm.pred != crime01.test)
# 18.2% test error rate.

# LDA
lda.fit = lda(crime01~.-crime01-crim, data=Boston, subset=train)
lda.pred = predict(lda.fit, Boston.test)
mean(lda.pred$class != crime01.test)
# 13.4% test error rate.

lda.fit = lda(crime01~.-crime01-crim-chas-tax, data=Boston, subset=train)
lda.pred = predict(lda.fit, Boston.test)
mean(lda.pred$class != crime01.test)
# 12.3% test error rate.

lda.fit = lda(crime01~.-crime01-crim-chas-tax-lstat-indus-age, data=Boston, subset=train)
lda.pred = predict(lda.fit, Boston.test)
mean(lda.pred$class != crime01.test)
# 11.9% test error rate.

# KNN
library(class)
train.X = cbind(zn, indus, chas, nox, rm, age, dis, rad, tax, ptratio, black, lstat, medv)[train, ]
test.X = cbind(zn, indus, chas, nox, rm, age, dis, rad, tax, ptratio, black, lstat, medv)[test, ]
train.crime01 = crime01[train]
set.seed(1)

# KNN(k=1)
knn.pred = knn(train.X, test.X, train.crime01, k=1)
mean(knn.pred != crime01.test)
# 45.8% test error rate.

# KNN(k=10)
knn.pred = knn(train.X, test.X, train.crime01, k=10)
mean(knn.pred != crime01.test)
# 11.1% test error rate.

# KNN(k=100)
knn.pred = knn(train.X, test.X, train.crime01, k=100)
mean(knn.pred != crime01.test)
# 49.0% test error rate.

# KNN(k=10) with subset of variables
train.X = cbind(zn, nox, rm, dis, rad, ptratio, black, medv)[train, ]
test.X = cbind(zn, nox, rm, dis, rad, ptratio, black, medv)[test, ]
knn.pred = knn(train.X, test.X, train.crime01, k=10)
mean(knn.pred != crime01.test)
# 27.3% test error rate.