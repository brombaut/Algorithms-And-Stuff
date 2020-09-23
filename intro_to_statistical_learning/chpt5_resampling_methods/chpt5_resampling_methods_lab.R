rm(list=ls())
library(ISLR)

# Cross-Validation and the Bootstrap
## The Validation Set Approach
set.seed(1)
# Use sample() function to split the set of observations into two halves, 
# by selecting a random subset of 196 observations out of the original 392 observations.
train=sample(392, 196)
# Then use the subset option in lm() to fit a linear regression using
# only the observations corresponding to the training set.
lm.fit = lm(mpg~horsepower, data=Auto, subset=train)
# Use predict() function to estimate the response for all 392 observations, 
# and we use the mean() function to calculate the MSE of the 196 observations
# in the validation set. Note that the -train index below selects only the 
# observations that are not in the training set.
attach(Auto)
mean((mpg-predict(lm.fit, Auto))[-train]^2)
# Therefor the estimated MSE for the linear regression fit is 23.26.
# We can use the poly() function to estimate the test error for the quadratic
# and cubic regressions.
lm.fit2 = lm(mpg~poly(horsepower, 2), data=Auto, subset=train)
mean((mpg-predict(lm.fit2, Auto))[-train]^2)
lm.fit3 = lm(mpg~poly(horsepower, 3), data=Auto, subset=train)
mean((mpg-predict(lm.fit3, Auto))[-train]^2)
# These errors are 18.72 and 18.79 respectively. If we choose a different training 
# set instead, then we will obtain somewhat different errors on the validation set
set.seed(2)
train = sample(392, 196)
lm.fit = lm(mpg~horsepower, subset=train)
mean((mpg-predict(lm.fit, Auto))[-train]^2)
lm.fit2 = lm(mpg~poly(horsepower, 2), data=Auto, subset=train)
mean((mpg-predict(lm.fit2, Auto))[-train]^2)
lm.fit3 = lm(mpg~poly(horsepower, 3), data=Auto, subset=train)
mean((mpg-predict(lm.fit3, Auto))[-train]^2)
# Using the split of the observations into a training set and a validation set, 
# we find that the validation set error rates for the models with lienar, quadratic,
# and cubic terms are 25.73, 20.43, and 20.39 respectively.
# These results are consistent with out previous findings: a model that predicts
# mpg using a quadratic function of horsepower performs better than a model
# that involves using only a linear function of horsepower, and there is 
# little evidence in favor of a model that uses a cubic function of horsepower.

## Leave-One-Out Cross-Validation
# The LOOCV estimate can be automatically computed for any generalized linear
# model using the glm() and cv.glm() functions. In the lab for Chapter 4, we 
# used the glm() function to perform logistic regression by passing in the 
# family="binomial" argument. But if we use glm() to fit a model without
# passing in the family argument, then it performs linear regression, just
# like the lm() function. So for instance:
glm.fit = glm(mpg~horsepower, data=Auto)
coef(glm.fit)
# and
lm.fit = lm(mpg~horsepower, data=Auto)
coef(lm.fit)
# yield identical linear regression models. In this lab, we will perform linear regression
# using the glm() function rather than the lm() function because the former can be used together
# with cv.glm(). The cv.glm() function is part of the boot library.
library(boot)
glm.fit = glm(mpg~horsepower, data=Auto)
cv.err = cv.glm(Auto, glm.fit)
cv.err$delta
# The cv.glm() function produces a list with several components. The two numbers in the
# delta vector contain the cross-validation results. In this case the numbers are
# identical (up to two decimal places) and correspond to the LOOCV statistic given
# in (5.1). Below, we discuss a situation in which the two numbers differ. 
# Our cross-validation estumate for the test error is approximately 24.23.
# We can repeat this procedure for increasingly complex polynomial fits. To automate
# the process, we use the for() function to initate a loop which iteratively fits 
# polynomial regressions for polynomials of order i=1 to i=5, computes the associated
# cross-validation error, and stores it in the ith element of the vector cv.error.
# We begin by initializing the vector. This will probably take a few minutes
cv.error = rep(0, 5)
for (i in 1:5) {
  glm.fit = glm(mpg~poly(horsepower, i), data=Auto)
  cv.error[i] = cv.glm(Auto, glm.fit)$delta[1]
}
cv.error
# We see a sharp drop in the estimated test MSE between the linear and
# quadratic fits, but then no clear improvement from using higher-order polynomials.

## k-Fold Cross-Validation
# The cv.glm() function can also be used to implement k-fold CV. Below we use
# k=10, a common choice for k, on the Auto data set. We once again set a random
# seed and initialize a vector in which we will store the CV errors corresponding
# to the polunomial fits of orders one to ten.
set.seed(17)
cv.error.10 = rep(0, 10)
for (i in 1:10) {
  glm.fit = glm(mpg~poly(horsepower, i), data=Auto)
  cv.error.10[i] = cv.glm(Auto, glm.fit, K=10)$delta[1]
}
cv.error.10
# Notice that the computation time is much shorter than that of LOOCV.
# We still see little evidence that using cubic or higher-order polynomial
# terms leads to lower test error than simply using a quadratic fit.
# We saw earlier that the two numbers associated with delta are essentially
# the same when LOOCV is performed. When we instead perform k-fold CV, then
# the two numbers associated with delta differ slightly. The first is the
# standard k-fold CV estimate. The second is a bias-corrected version.
# On this data set, the two estimates are very similar to each other.

## The Bootstrap
# Estimating the Accuracy of a Statistic of Interest
# One of the great advantages of the bootstrap approach is that it can be applied
# in almost all situations. No complicated mathematical calculations are required.
# Performing a bootstrap analysis in R entails only two steps. First, we must create
# a function that computes the statistic of interest. Second, we use the boot() function,
# which is part of the boot library, to perform the bootstrap by repeatedly sampling 
# observations from the data set with replacement.
# The Portfolio data set in the ISLR package is described earlier.
# To illustrate the use of the bootstrap on the data, we must first create
# a function, alpha.fn(), which takes as input (X, Y) data as well as a vector indication 
# which observations should be used to estimate alpha. The function then outputs the
# estimate for alpha based on the selected observations,
alpha.fn = function(data, index) {
  X = data$X[index]
  Y = data$Y[index]
  return ((var(Y) - cov(X, Y))/(var(X) + var(Y) - 2*cov(X, Y)))
}
# The function returns an estimate for alpha based on applying (5.7) to the obersvations
# indexed by the argument index. For instance, the following command tells R to estimate
# alpha using all 100 observations
alpha.fn(Portfolio, 1:100)
# The next command uses the sample() function to randomly select 100 observations from
# the range 1 to 100, with replacement. This is equivalent to constructin a new
# bootstrap data set and recomputing alpha estimate based on the new data set.
set.seed(1)
alpha.fn(Portfolio, sample(100, 100, replace=T))
# We can implement a bootstrap analysis by performing this command many times, 
# recording all of the corresponding estumates for alpha, and computing the resulting
# standard deviation. However, the boot() function automates this approach.
# Below we produce R=1000 bootstrap estimates for alpha.
boot(Portfolio, alpha.fn, R=1000)
# The final output shows that using the original data, alpha estimate=0.578,
# and that the bootstrap estimate for SE(alpha estimate) is 0.093.

# Estimateing the Accuracy of a Linear Regression Model
# The bootstrap appriach can be used to assess the variability of the coefficient estimates
# and predictions from a statistical learning method. Here we use the bootstrap approach
# in order to assess the variability of the estimates for B0 and B1, the intercept and slope
# terms for the linear regression model that uses horsepower to predict mpg in the Auto data
# set. We will compare the estimates obtained using the bootstrap to those obetained using 
# the formulas for SE(B0 hat) and SE(B1 hat) described in Section 3.1.2.
# We first create a simple function, boot.fn(), which takes in the Auto data set as well
# as a set of indices for the observations, and returns the intercept and slope estimates for
# the linear regression model. We then apply this function to the full set of 392 observations
# in order to compute the estimates for B0 and B1 on the entire data set using the usual linear
# regression coefficient estimate formulas from Chapter 3.
boot.fn = function(data, index) {
  return (coef(lm(mpg~horsepower, data=data, subset=index)))
}
boot.fn(Auto, 1:392)
# The boot.fn() function can also be used in order to create bootstrap estimates
# for the intercept and slope terms by randomly sampling from among the
# observations with replacement. Here we give two examples:
set.seed(1)
boot.fn(Auto, sample(392, 392, replace=T))
boot.fn(Auto, sample(392, 392, replace=T))
# Next, we use the boot() function to compute the standard errors of 1000 bootstrap estimates
# for the intercept and slope terms.
boot(Auto, boot.fn, 1000)
# This indicates that the bootstrap estimates for SE(B0 hat ) is 0.84, and that the bootstrap 
# estimate for SE(B1 hat) is 0.0073. As discussed in Section 3.1.2, standard formulas can
# be used to compute the standard errors for the regression coefficients in a linear model.
# These can be obtained using summary() function.
summary(lm(mpg~horsepower, data=Auto))$coef
# The standard error estimates for B0 hat and B1 hat obtained using the formulas
# from Section 3.1.2 are 0.717 for the intercept and 0.0064 for the slope. Interestingly,
# these are somewhat different from the estimates obtained using the bootstrap. Does this
# indicate a problem with the bootstrap? In fact, it suggests the opposite. Recall that
# the standard formulas given in equation 3.8 on page 66 rely on certain assumptions. For example,
# they depend on the unknown parameter noise variance. We then estimate the noise variance
# using the RSS. Now although the formula for the standard errors do not rely on the 
# linear model being correct, the estimate for the noise variance does. We see
# in Figure 3.8 on page 91 that there is a non-linear relationship in the data, and
# so the residuals from a linear fit will be inflated, and so will the noise variance. Secondly,
# the standard formulas assume (somewhat unrealisticaly) that the x_i are fixed, and all the
# variability comes from the variation in the errors e_i. The bootstrap approach does not
# rely on any of these assumptions, and so it is likely giving a more accurate estimate of 
# the standard errors for B0 hat and B1 hat than the summary() function.
# Below we compute the bootstrap standard error estimates and the standard linear regression estimates
# that result from fitting the quadrati model to the data. Since this model provides a good
# fit to the data (Figure 3.8), there is now a better correspondence between the bootstrap estimates
# and the standard estimates of SE(B0 hat), SE(B1 hat), and SE(B2 hat).
boot.fn = function(data, index) {
  coefficients(lm(mpg~horsepower+I(horsepower^2), data=data, subset=index))
}
set.seed(1)
boot(Auto, boot.fn, 1000)
summary(lm(mpg~horsepower+I(horsepower^2), data=Auto))$coef
        