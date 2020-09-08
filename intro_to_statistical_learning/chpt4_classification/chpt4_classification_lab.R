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
plot(lda.fit)
lda.pred = predict(lda.fit, Smarket.2005)
names(lda.pred)
lda.class = lda.pred$class
table(lda.class, Direction.2005)
mean(lda.class==Direction.2005)
sum(lda.pred$posterior[,1] >= 0.5)
sum(lda.pred$posterior[,1] < 0.5)
lda.pred$posterior[1:20,1]
lda.class[1:20]
sum(lda.pred$posterior[,1] > 0.9)
