rm(list=ls())
library(ISLR)

### The Stock Market Data
names(Smarket)
dim(Smarket)
summary(Smarket)
pairs(Smarket)
# Produce a matrix that contains all of the pairwise correlations among the predictors in a data set
cor(Smarket [,-9])
# Only substantial correlation is between Year and Volume.
attach(Smarket)
plot(Volume)


### Logistic Regression
# Fit a logistic regression model in order to predict Direction using Lag1 through Lag5 and volume
glm.fits = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data=Smarket, family=binomial)
summary(glm.fits)
# Use coef() in order to access just the coefficients for this fitted model.
coef(glm.fits)
summary(glm.fits)$coef
summary(glm.fits)$coef[,4]
# Use predict() function to predict the probability that the market will go up, given values
# of the predictors. The type="response" options tells R to output probabilities of the form P(Y=1|X),
# as opposed to other information such as the logit.
glm.probs = predict(glm.fits, type="response")
glm.probs[1:10]
# We know that these values correspond to the probability of the market going up, rather than down, 
# because the contrasts() function indicates that R has created a dummy variable with a 1 for Up.
contrasts(Direction)
# Create a vector of class predictions based on whether the predicted probability of a market 
# increase is greater than or less than 0.5
glm.pred = rep("Down", 1250)
glm.pred[glm.probs > 0.5] = "Up"
# How many observations were correctly or incorrectly classified
table(glm.pred, Direction)
(507+145)/1250
mean(glm.pred == Direction)
# Create avector corresponding to the obervations from 2001 to 2004.
# We will then use this vector to vteaye a held out data set of observations from 2005.
train=(Year<2005)
Smarket.2005=Smarket[!train,]
dim(Smarket.2005)
Direction.2005=Direction[!train]
# Now fit a logistic regression model using only the subset of the obervations that correspond to 
# dates before 2005. Then obtain predicted probabilities of the stock market going up for each of the
# days in our test set - that is, for the days in 2005.
glm.fits=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data=Smarket, family=binomial, subset=train)
glm.probs=predict(glm.fits, Smarket.2005, type="response")
# Note that we have trained and tested our model on two completly separate data sets: training was
# performed using only the dates before 2005, and testing was performed using only the dates in 2005.
# Finally, we compute the predictions for 2005 and compare them to the actual movements of the market
# over that time period.
glm.pred=rep("Down", 252)
glm.pred[glm.probs > 0.5] = "Up"
table(glm.pred, Direction.2005)
mean(glm.pred == Direction.2005)
mean(glm.pred != Direction.2005)
# A dissapointing error rate of 52%. What if we try and remove the predictors that have the highest p-values?
glm.fits=glm(Direction~Lag1+Lag2, data=Smarket, family=binomial, subset=train)
glm.probs=predict(glm.fits, Smarket.2005, type="response")
glm.pred=rep("Down", 252)
glm.pred[glm.probs > 0.5] = "Up"
table(glm.pred, Direction.2005)
mean(glm.pred == Direction.2005)
106/(106+76)

### Linear Discriminant Analysis
# Perform LDA on the Smarket data.
library(MASS)
lda.fit=lda(Direction~Lag1+Lag2, data=Smarket, subset=train)
lda.fit
# The plot() function produces plots of the linear discriminants, obtained by computing
# -0.642*Lag1 - 0.514*Lag2 for each of the training observations
plot(lda.fit)
# The predict() function returns alist with three elements. 
# The first element, class, containes the LDA's predictions about the movements of the market.
# The second element, posterior, is a matrix whose kth column contains the posterior probability
# that the corresponding ovservation belongs to the kth class.
# Finally, x contains the linear discriminants.
lda.pred = predict(lda.fit, Smarket.2005)
names(lda.pred)
# Note that LDA and logistic regression predictions are almost identical.
lda.class = lda.pred$class
table(lda.class, Direction.2005)
mean(lda.class==Direction.2005)
# Applying a 50% threshold to the posterior probabilities allows us to recreate the predictions contained
# in lda.pred$class
sum(lda.pred$posterior[,1] >= 0.5)
sum(lda.pred$posterior[,1] < 0.5)
# Notice that the posterior probability output by the model corresponds to the probability that the
# market will decrease.
lda.pred$posterior[1:20,1]
lda.class[1:20]
# If we wanted to use a posterior probability threshold other than 50% in order to make predictions, 
# then we could easily do so. For instance, suppose that we wish to predict a market decrease only if 
# we are very certain that the market will indeed decrease on that day - say, if the posterior
# probability is at least 90%.
sum(lda.pred$posterior[,1] > 0.9)
# No days in 2005 meet that threshold! In fact, the greatest posterior probability of decrease in all 
# of 2005 was 52.02%.

### Quadratic Discriminant Analysis
# Fit a QDA model to the Smarket data.
qda.fit=qda(Direction~Lag1+Lag2, data=Smarket, subset=train)
qda.fit
# The output contains the group means. But it does not contain the coefficients of the linear 
# discriminants, because the QDA classifier involves a quadratic, rather than linear, function of 
# the predictos. The predict() function works in exactly the same fashion as LDA.
qda.class=predict(qda.fit, Smarket.2005)$class
table(qda.class, Direction.2005)
mean(qda.class == Direction.2005)
# Interestingly, the QDA predictions are accurate almost 60% of the time, even though the 2005
# data was not used to fit the model. This level of accuracy is quite impressive for stock
# market data, which is known to be quite hard to model accurately. This suggests that thet quadratic 
# form assumed by QDA may capture the true relationship more accurately than the linear forms 
# assumed by LDA and logistic regression. However, we recommend evaluating this method's
# performance on a larger test set before betting that this approach will consistently beat the market.

### K-Nearest Neighbors
# We need some specific inputs for knn() function.
library(class)
train.X=cbind(Lag1, Lag2)[train,]
test.X=cbind(Lag1, Lag2)[!train,]
train.Direction=Direction[train]
# We must set a seed to ensure reproducibility of results, since if if several observations are tied
# as nearest neighbors, then R will randomly break the tie.
set.seed(1)
knn.pred=knn(train.X, test.X, train.Direction, k=1)
table(knn.pred, Direction.2005)
(83+43)/252
# The results using K=1 are not very good, since only 50% of the observations are correctly predicted.
# Of course, it may be that K=1 results in an overly flexible fit to the data. Repeat with K=3.
knn.pred=knn(train.X, test.X, train.Direction, k=3)
table(knn.pred, Direction.2005)
mean(knn.pred == Direction.2005)
# The results have improved slightly. But increasing K further turns out to provide no further improvements.
# It appears that for this data, QDA provides the best results of the methods that we have examined so far.

### An Application to Caravan Insurance Data
# Apply the KNN approach to the Caravan data set.
# The response variable is Purchase, which indicates whether or not a given individual purchases a 
# caravan insurance policy. In this data set, only 6% of people purchased caravan insurance.
dim(Caravan)
attach(Caravan)
summary(Purchase)
348/5474
# Because the KNN classifier predicts the class of a given test observation by identifying the obervations
# that are nearest to it, the scale of the variables atters. Any variables that are on a huge scale will
# have a much larger effect on the distance between the observations.
# A good way to handle this problem is to standardize the data so that all variables are given
# a mean of zero and a standard deviation of one. Then all variables will be one a comparable scale.
# The scale() function does just this. In standardizing the data, we exclude column 86, because
# this is the qualitative Purchase variable.
standardized.X = scale(Caravan[, -86])
var(Caravan[,1])
var(Caravan[,2])
var(standardized.X[,1])
var(standardized.X[,2])
# Now every column of standardized.X has a standard deviation of one and a mean of zero.
# We now split the observations into a test set, containing the first 1000 obervations,
# and a training set, containing the remaining observations.
# We fit the KNN model on the training data using K=1, and evaluate its performance on the test data.
test=1:1000
train.X = standardized.X[-test,]
test.X = standardized.X[test,]
train.Y = Purchase[-test]
test.Y = Purchase[test]
set.seed(1)
knn.pred = knn(train.X, test.X, train.Y, k=1)
mean(test.Y != knn.pred)
mean(test.Y != "No")
# The KNN error rate on the 1000 test obervations is just under 12%. This may appear to be fairly good,
# however, since only 6% of customers purchased insurance, we could get the error rate down to 6% by 
# always predicting No regardless of the values of the predictions.
# Suppose that there is some non-trivial cost to trying to sell insurance to a given individual. If 
# the company tries to sell insurance to a random selection of customers, the the success rate will only
# be 6%, which may be far to low given the costs involved. Instead, the company would like to try 
# to sell insurance only to customers who are likely to buy it. So the overall error rate is not of interest.
# Instead, the fraction of individuals that are correctly predicted to buy insurance is of interest.
# It turns out that KNN wutg K=1 does far better than random guessing among the customers that are 
# predicted to buy insurance. Among 77 such customers, 9, or 11.7%, actually do purchase insurance.
# This is double the rate that one would obtain from random guessing.
table(knn.pred, test.Y)
9/(68+9)
# Using K=3, the success rate increases to 19%, and with K=5 the rate is 26.7%. This is over four
# times the rate that results from random guessing. It appears that KNN is finding some real
# patterns in a difficult data set.
knn.pred = knn(train.X, test.X, train.Y, k=3)
table(knn.pred, test.Y)
5/26
knn.pred = knn(train.X, test.X, train.Y, k=5)
table(knn.pred, test.Y)
4/15
# As a comparison, we can also fit a logistic regression model to the data. If we use 0.5 as the 
# predicted probability cut-off for the cliassifier, then we have a problem: only seven of the test
# observations are predicted to purchase insurance. Even worse, we are wrong about all of these!
# However, we are not required to use a cut-off of 0.5. If we instead predict a purchase any time 
# the predicted probability of purchase exceeds 0.25, we get much better results: we predict
# that 33 people will purchase insurance, and we are correct for 33% of these people. This
# is over five times better than random guessing.
glm.fits=glm(Purchase~., data=Caravan, family=binomial, subset=-test)
glm.probs = predict(glm.fits, Caravan[test,], type="response")
glm.pred=rep("No", 1000)
glm.pred[glm.probs > 0.5] = "Yes"
table(glm.pred, test.Y)

glm.pred=rep("No", 1000)
glm.pred[glm.probs > 0.25] = "Yes"
table(glm.pred, test.Y)
11/(22+11)
