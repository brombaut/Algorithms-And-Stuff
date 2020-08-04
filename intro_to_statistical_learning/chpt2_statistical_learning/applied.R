
library(ISLR)
library(MASS)


# 8(a) Use the read.csv() function to read the data into R
college = read.csv("data_sets/College.csv")

# 8(b) Look at the data using the fix() function. Note the first column is just the name of the university.
# We don't want R to treat this as data. Give each row a name corresponding to the appropriate university,
# so that R will not try to perform calculations on the row names. However, we still need to eliminate the first column
# in the data where the names are stored.
rownames(college)=college[,1]
college = college[,-1]

# 8(c)i. Use the summary() function to produce a numberical summary of the variables in the data set
summary(college)

# 8(c)ii. Use the pairs() function to produce a scatterplot matrix of the first ten columns or variables in the data
pairs(college[2:12])

# 8(c)iii. Use the plot() function to produce side-by-side boxplots of Outstate versus Private
college$Private = as.factor(college$Private)
plot(college$Private, college$Outstate)

# 8(c)iV. Create a new qualitative variable, called Elite, by 'binning' the Top10perc variable
# We are going to divide universities into two groups based on whether or not the proportion of students
# coming from the top 10% of their high school classes exceeds 50%
Elite=rep("No",nrow(college))
Elite[college$Top10perc > 50] = "Yes"
Elite = as.factor(Elite)
college=data.frame(college, Elite)

# Use the summary() function to see how many elite universities there are.
summary(college$Elite)

# Now use the plot() function to produce side-by-side boxplots of Outstate versus Elite.
plot(college$Elite, college$Outstate)

# 8(c)v. Use the hist() function to produce some histograms with differing numbers of bins for a few of the quantitative variables.
# Hint; par(mfrow=c(2,2)) will divide the print window into four regions so that four plots can be made simultaneously.
# Modifying the arguments to this function will divide the screen in other ways
par(mfrow=c(2,2))
hist(college$Apps)
hist(college$Accept)
hist(college$Enroll)
hist(college$Grad.Rate)

# 8(c)vi. Continue exploring the data, and provide a brief summary of what you discover.

