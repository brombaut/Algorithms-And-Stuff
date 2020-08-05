rm(list=ls())
library(ISLR)
library(MASS)

View(Boston)
names(Boston)

attach(Boston)

### Simple Linear Regression
# Fit a simple linear regression model, with medv as the response and lstat as the predictor
lm.fit=lm(medv~lstat)
# Output some basic info about the model
lm.fit
# Output more detailed info about the model
summary(lm.fit)
# Find out what other pieces of information are stored in lm.fit
names(lm.fit)
# Although we can use lm.fit$coefficients it is safer to use the extractor functions 
# like coef() to access them
coef(lm.fit)
# Obtain a confidence interval for the coefficient estimates
confint(lm.fit)
# Produce confidence intervals and prediction intervals for the prediction of medv 
# for a given value of lstat
predict(lm.fit, data.frame(lstat=c(5,10,15)), interval="confidence")
predict(lm.fit, data.frame(lstat=c(5,10,15)), interval="prediction")
# Plot medv and lstat along with the least squares regression line
plot(lstat, medv)
abline(lm.fit)
# Some other abline and plot examples
abline(lm.fit, lwd=3)
abline(lm.fit, lwd=3, col="red")
plot(lstat, medv, col="red")
plot(lstat, medv, pch=20)
plot(lstat, medv, pch="+")
plot(1:20, 1:20, pch=1:20)
# View 4 diagnostic plots at once. Pass the output from lm.fit to plot(). 
# Usually, you would have to press enter to cycle through them
par(mfrow=c(2,2))
plot(lm.fit)
# Compute residuals from a linear regression fit using the residuals() function.
plot(predict(lm.fit), residuals(lm.fit))
# The function rstudent() will return the studentized residuals, 
# and we can use this function to plot the residuals against the fitted values
plot(predict(lm.fit), rstudent(lm.fit))
# On the basis of the residual plots, there is some evidence of non-linearity. 
# Leverage statistics can be computed for any number of predictors using 
# the hatvalues() function
plot(hatvalues((lm.fit)))
# The which.max() function identifies the index of the largest element of a vector.
# In this case, it tells us which observation has the largest leverage statistic
which.max(hatvalues(lm.fit))

### Multiple Linear Regression
# Multiple linear regression with 2 predictors
lm.fit=lm(medv~lstat+age, data=Boston)
summary(lm.fit)
# Using all the predictors in Boston dataset
lm.fit=lm(medv~., data=Boston)
summary(lm.fit)
# Access individual components of summary object by name
summary(lm.fit)$r.sq  # R Squared
summary(lm.fit)$sigma  # RSE
# The vif() function (car packckage) can be used to compute variance inflation factors
library(car)
vif(lm.fit)
# Perform regression using all variables but one
lm.fit1=lm(medv~.-age, data=Boston)
summary(lm.fit1)
# Or use update()
lm.fit1=update(lm.fit, ~.-age)

### Interaction Terms
# Include interaction terms using the syntax lstat:black
summary(lm(medv~lstat+age+lstat:age, data=Boston))
# Or use shorthand syntax
summary(lm(medv~lstat*age, data=Boston))

### Non-linear Transformations of the Predictors
# Perform a regression of medv onto lstat and lstat^2
lm.fit2=lm(medv~lstat+I(lstat^2))
summary(lm.fit2)
# Note the near zero p-value associated with the quadratic term which suggests that it 
# leads to an improved model
# We use anova() function to further quantify the extent to which the quadratic fit is superior
# to the linear fit.
lm.fit=lm(medv~lstat)
anova(lm.fit, lm.fit2)
# anova() function performs a hypothesis test comparing the two models. The null hypothesis is that the
# two models fit the data equally well, and the alternative hypothesis is that the full model is superior.
# Here the F-statistic is 135 and the associated p-value is virtually zero.
# This provides very clear evidence that the model containing the predictors lstat and lstat^2 is far
# superior to the model that only contains the predictor lstat. This is not surprising, since earlier
# we saw evidence for non-linearity in the relationship between medv and lstat.
# If we do:
par(mfrow=c(2,2))
plot(lm.fit2)
# we can see that when the lstat^2 term is included in the model, there is little discernable pattern
# in the residuals
# To create higher-order polynomials, use the following syntax
lm.fit5=lm(medv~poly(lstat,5))
summary(lm.fit5)
# This suggests that including additional polynomial terms, up to the fifth order, leads to an
# improvement in the model fit. However, further investigation of the data reveals that no polynomial
# terms beyond fifth order have significant p-values in a regression fit.
lm.fit7=lm(medv~poly(lstat,7))
summary(lm.fit7)
# We can also try a log transformation
summary(lm(medv~log(rm), data=Boston))


### Qualitative Predictors
# We will now examine the Carseats data and attempt to predict Sales (child car seat sales) in 400 locations
# based on a number of predictors.
View(Carseats)
names(Carseats)
# This data includes qualitative predictors such as Shelveloc, an indicator of the quality of the shelving
# location - that is, the space within a store in which the car seat is displayed - at each location.
# The predictor Shelveloc takes on three possible values, Bad, Medium, and Good. Given a qualitative
# variable such as Shelveloc, R generates dummy variables automatically.
# Below we fit a multiple regression model that includes some interaction terms.
lm.fit=lm(Sales~.+Income:Advertising+Price:Age,data=Carseats)
summary(lm.fit)
# The contrasts() function returns the coding that R uses for the dummy variables
attach(Carseats)
contrasts(ShelveLoc)
# R has created a ShelveLocGood dummy variable that takes on a value of 1 if the shelving location 
# is good, and 0 otherwise. A bad shelving location corresponds to a zero for each of the two dummy
# variables. The fact that the coefficient for ShelveLocGood in the regression output is positive
# indicates that a good shelving location is associated with a high sales (relative to a bad location).
# And ShelveLocMedium has a smaller positive coefficient, indication that a medium shelving location leads
# to higher sales than a bad shelving location but lower sales than a good shelving location.

### Writing Functions
LoadLibraries=function(){
  library(ISLR)
  library(MASS)
  print("The libraries have been loaded!")
}
