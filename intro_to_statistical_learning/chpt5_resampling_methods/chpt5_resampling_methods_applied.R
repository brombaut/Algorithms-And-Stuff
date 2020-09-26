rm(list=ls())
library(ISLR)

## 5
# In chapter 4, we used logistic regression to predict the probability of default using income
# and balance on the Default data set. We will now estimate the test error of this logistic
# regression model using the validation set approach. Do not forget to set a random seed before
# beginning your analysis.
summary(Default)
attach(Default)
# a) Fit a logistic regression model that uses income and balance to predict default
set.seed(1)
glm.fit = glm(default ~ income + balance, data=Default, family=binomial)
# b) Using the validation set approach, estaimte the test error of this model. In
# order to do this, you need to preform the following steps:
# i) Split the sample set into a training set and a validation set
# ii) Fit a multiple logistic regression model using only the training observations.
# iii) Obtain a prediction of default status for each individual in the validation set by
# computing the posterior probability of default for that individual, and classifying the individual
# to the default category if the posterior probability is greater than 0.5
# iv) Compute the validation set error, which is the fraction of the obervations in the validation
# set that are misclassified.
FiveB = function() {
  # i.
  train = sample(dim(Default)[1], dim(Default)[1]/2)
  # ii.
  glm.fit = glm(default ~ income + balance, data=Default, family=binomial, subset=train)
  # iii.
  glm.pred = rep("No", dim(Default)[1]/2)
  glm.probs = predict(glm.fit, Default[-train, ], type = "response")
  glm.pred[glm.probs > 0.5] = "Yes"
  # iv.
  return(mean(glm.pred != Default[-train, ]$default))
}
FiveB() # 2.54% test error rate from validation set approach
# c) Repeat the process in (b) three times, using three different splits of the observations into a 
# training set and a validation set. Comment on the results obtained.
FiveB() # 0.0274
FiveB() # 0.0244
FiveB() # 0.027
# Average error is about  2.5%
# d) Now consider a logistic regression model that predicts the probability of default using income, 
# balance, and a dummy variable for student. Estimate the test error for this model using the
# validation set approach. Comment on whether or not including a dummy variable for student leads to 
# a reduction in the test error rate.
train = sample(dim(Default)[1], dim(Default)[1]/2)
glm.fit = glm(default ~ income + balance + student, data=Default, family=binomial, subset=train)
glm.pred = rep("No", dim(Default)[1]/2)
glm.probs = predict(glm.fit, Default[-train, ], type = "response")
glm.pred[glm.probs > 0.5] = "Yes"
mean(glm.pred != Default[-train, ]$default)
# 2.64% test error rate, with student dummy variable. Using the validation set approach, 
# it doesn't appear adding the student dummy variable leads to a reduction in the test error rate.

# 6) We continue to consider the use of a logistic regression model to predict the probability of
# default using income and balance on the Default data set. In particular, we will now compute 
# estimates for the standard errors of the income and balance logistic regression coefficients
# in two separate ways: (1) using the bootstrap, and (2) using the standard formula for computing
# the standard errors in the glm() function. Do not forget to set a random seed.
summary(Default)
# a) Using the summary() and glm() functions, determine the estimated standard errors for the
# coefficients associated with income and balance in a multiple logistic regression model that 
# uses both predictors.
set.seed(1)
glm.fit = glm(default ~ income + balance, data=Default, family=binomial)
summary(glm.fit)
# b) Write a function, boot.fn(), that takes as input the Default data set as well as an index
# of observations, and that outputs the coefficient estimates for income and balance in the
# multiple logistic regression model.
boot.fn = function(data, index) {
  return(coef(glm(default~income+balance, data=data, family=binomial, subset=index)))
}
# c) Use the boot() function together with your boot.fn() function to estimate the standard errors
# of the logistic regression coefficients for income and balance.
library(boot)
boot(Default, boot.fn, 50)
# d) Comment on the estimated standard errors obtained using the glm() function and using
# the bootstrap function.
# Similar answers to the second and third significant digits.

# 7) In Sections 5.3.2 and 5.3.3, we saw that the cv.glm() function can be used in order to compare
# the LOOCV test error estimate. Alternatively, one would compute those quantities using
# just the glm() and predict.glm() functions, and a for loop. You will now take this approach
# in order to compute the LOOCV error for a simple logistic regression model on the Weekly
# data set. Recall that in the context of classification problems, the LOOCV error is given
# in (5.4)
summary(Weekly)
set.seed(1)
attach(Weekly)
# a) Fit a logistic regression model that predicts Direction using Lag1 and Lag2.
glm.fit = glm(Direction~Lag1+Lag2, data=Weekly, family=binomial)
summary(glm.fit)
# b) Fit a logistic regression model that predicts Direction using Lag1 and Lag2 using
# all but the first observation.
glm.fit = glm(Direction~Lag1+Lag2, data=Weekly[-1, ], family=binomial)
summary(glm.fit)
# c) Use the model from (b) to predict the direction of the first observation. You can 
# do this by predicting that the first obervation will go up if 
# P(Direction="Up" | Lag1, Lag2) > 0.5. Was this observation correctly classified?
predict.glm(glm.fit, Weekly[1, ], type = "response") > 0.5
# Prediction was UP, true Direction was DOWN.
# d) Write a for loop for i=1..n, where n is the number of observations in the data set,
# that performs each of the following steps:
# i) Fit a logistic regression model using all but he ith observation to predict Direction
# using Lag1 and Lag2.
# ii) Compute the posterior probability of the market moving up for the ith observation.
# iii) Use the posterior probability for the ith observation in order to predict whether or not
# the market moves up.
# iv) Determine whether or not an error was made in predicting the direction of the ith 
# observation. If an error was made, then indicate this as a 1, and otherwise a 0.
count = rep(0, dim(Weekly)[1])
for (i in 1:(dim(Weekly)[1])) {
  glm.fit = glm(Direction ~ Lag1 + Lag2, data = Weekly[-i, ], family = binomial)
  is_up = predict.glm(glm.fit, Weekly[i, ], type = "response") > 0.5
  is_true_up = Weekly[i, ]$Direction == "Up"
  if (is_up != is_true_up) {
    count[i] = 1
  }
}
sum(count) # 490 errors.
# e) Take the average of the n numbers obtained in (d)iv in order to obtain the LOOCV
# estimate for the test error. Comment on the results.
mean(count) # LOOCV estimates a test error rate of 45%.

# 8) We will now perform cross-validation on a simulated data set.
# a) Generate a simulated data set as follows:
set.seed(1)
x = rnorm(100)
y = x - 2*x^2 + rnorm(100)
# In this data set, what is n and what is p? Write out the model used to generate the data
# in equation form.
# n = 100, p = 2.
# Y= X − 2X^2 + ϵ.
# b) Create a scatterplot of X against Y. Comment on what you find.
plot(x, y) # Quadratic plot. X from about -2 to 2. Y from about -8 to 2.
# c) Set a random seed, and then compute the LOOCV errors that result from fitting the following
# four models using least squares:
library(boot)
Data = data.frame(x, y)
set.seed(1)
# i) Y = B0 + B1*X + epsilon
glm.fit = glm(y ~ x)
cv.glm(Data, glm.fit)$delta # [1] 7.288162 7.284744
# ii) Y = B0 + B1*X + B2*X^2 + epsilon
glm.fit = glm(y ~ poly(x, 2))
cv.glm(Data, glm.fit)$delta # [1] 0.9374236 0.9371789
# iii) Y = B0 + B1*X + B2*X^2 + B3*X^3 + epsilon
glm.fit = glm(y ~ poly(x, 3))
cv.glm(Data, glm.fit)$delta # [1] 0.9566218 0.9562538
# iv) Y = B0 + B1*X + B2*X^2 + B3*X^3 + B4*X^4 + epsilon
glm.fit = glm(y ~ poly(x, 4))
cv.glm(Data, glm.fit)$delta # [1] 0.9539049 0.9534453
# Note you may find it helpful to use the data.frame() function to create a single data set
# containing both X and Y.
# d) Repeat (c) using another random seed, and report your results. Are your results the
# same as what you got in (c)? Why?
set.seed(10)
# i)
glm.fit = glm(y ~ x)
cv.glm(Data, glm.fit)$delta # [1] 7.288162 7.284744
# ii)
glm.fit = glm(y ~ poly(x, 2))
cv.glm(Data, glm.fit)$delta # [1] 0.9374236 0.9371789
# iii)
glm.fit = glm(y ~ poly(x, 3))
cv.glm(Data, glm.fit)$delta # [1] 0.9566218 0.9562538
# iv)
glm.fit = glm(y ~ poly(x, 4))
cv.glm(Data, glm.fit)$delta # [1] 0.9539049 0.9534453
# Exact same, because LOOCV will be the same since it evaluates n folds of a single observation.
# e) Which of the models in (c) had the smallest LOOCV error? Is this what you expected?
# Explain your answer.
# The quadratic polynomial had the lowest LOOCV test error rate. 
# This was expected because it matches the true form of Y.
# f) Comment on the statistical significance of the coefficient estimates that results 
# from fitting each of the models in (c) using least squares. Do these results agree
# with the conclusions drawn based on the cross-validation results?
summary(glm.fit)
# p-values show statistical significance of linear and quadratic terms, which 
# agrees with the CV results.

# 9) We will now consider the Boston housing data set, from the MASS library.
library(MASS)
summary(Boston)
set.seed(1)
attach(Boston)
# a) Based on this data set, provide an estimate for the population mean of medv. Call this
# estimate u_hat,
medv.mean = mean(medv)
medv.mean # 22.53
# b) Provide an estimate of the standard error of u_hat. Interpret this result.
# Hint: We can compute the standard error of the sample mean by dividing the sample
# standard deviation by the square root of the number of observations.
medv.err = sd(medv)/sqrt(length(medv))
medv.err # [1] 0.4088611
# c) Now estimate the standard error of u_hat using the bootstrap. How does this compare
# to your answer from (b)?
boot.fn = function(data, index) {
  return(mean(data[index]))
}
library(boot)
bstrap = boot(medv, boot.fn, 1000)
bstrap # 0.4106622
# Similar to answer from (b) up to two significant digits. (0.4119 vs 0.4089)
# d) Based on your bootstrap estimate from (c), provide a 95% confidence interval for the
# mean of medv. Compare it to the results obtained using t.test(Boston$medv).
# Hint: You can approximate a 95% confidence interval using the formula
# [u_hat - 2SE(u_hat), u_hat + 2SE(u_hat)]
t.test(medv) # 21.72953 23.33608
c(bstrap$t0 - 2 * 0.4106622, bstrap$t0 + 2 * 0.4106622) # [1] 21.71148 23.35413
# Bootstrap estimate very close to t.test estimate.
# e) Based on this data set, provide an estimate, u_hat_med, for the median value of medv in 
# the population.
medv.med = median(medv)
medv.med # [1] 21.2
# f) We now would like to estimate the standard error of u_hat_med. Unfortunately, there is
# no simple formula for computing the standard error of the median. Instead, estimate the
# standard error of the median using the bootstrap. Comment on your findings.
boot.fn = function(data, index) {
  return(median(data[index]))
}
boot(medv, boot.fn, 1000)
# Media of 21.1 and SE of 0.3770241. Small std. error relative to median value
# g) Based on this data set, provide an estimate for the tenth percentile of medv in 
# Boston suburbs. Call this quantity u_hat_0.1. You can use the quantil() function.
medv.tenth = quantile(medv, c(0.1))
medv.tenth # 12.75 
# h) Use the bootstrap to estimate the standard error of u_hat_0.1. Comment on your findings.
boot.fn = function(data, index) {
  return(quantile(data[index], c(0.1)))
}
boot(medv, boot.fn, 1000)
# Tenth-percentile of 12.75 with SE of 0.4925766.
# Small standard error relative to tenth-percentile value.