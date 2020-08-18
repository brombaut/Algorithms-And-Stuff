# Practical Analysis for Data Scientists

Key term and ideas from the book.

# Chpater 1 - Exploratory Data Analysis

## Data Types

### Key Terms

- **Numeric**

  Data that is expressed on a numeric scale

  - **Continuous**

    Data that can take on any value in an interval (Synonyms: interval, float, numeric)

  - **Discrete**

    Data that can take on only integer values, such as counts. (Synonyms: integer, count)

- **Categorical**:Data that can take on only a specific set of values representing a set of possible categories. (Synonyms: enum, enumerated, factors, nominal)

  - **Binary**

    A special case of categorical data with just two categories of values, e.g., 0/1, true/false. (Synonyms: dichotomous, logical, indicator, boolean)

  - **Ordinal**

    Categorical data that has an explicit ordering. (Synonym: ordered factor)

### Key Ideas

- Data is typically classified in software by type.
- Data types include numeric (continuous, discrete) and categorical (binary, ordinal).
- Data typing in software acts as a signal to the software on how to process the data.

## Rectangular Data

### Key Terms

- **Data frame**

  Rectangular data (like a spreadsheet) is the basic data structure for statistical and machine learning models.

- **Feature**

  A column within a table is commonly regerred to as a feature. (Synonyms: attribute, input, predictor, variable)

- **Outcome**

  Many data science projects involve predicting an outcome - often a yes/no outcome. The _features_ are sometimes used to predict the _outcome_ in an experiment or a study. (Synonyms: dependent variable, response, target, output)

- **Records**

  A row within a table is commonly referred to as a record. (Synonyms: case, example, instance obersvation pattern, sample)

### Key Ideas

- The basic data structure in data science is a rectangular matrix in which rows are records and columns are variables (features).
- Terminology can be confusing: there are a variety of synonyms arising from the different disciplines that contribute to data science (statistics, computer science, and IT).

## Estimates of Location

### Key Terms

- **Mean**

  The sum of all values divided by the number of values. (Synonym: average)

- **Weighted Mean**

  The sum of all values times a weight divided by the sum of the weights. (Synonym: weighted average)

- **Median**

  The value sucht hat one-half of the data lies above and below. (Synonym: 50th percentile)

- **Percentile**

  The value such that P percent of the data lies below. (Synonym: quantile)

- **Weighted Median**

  The value such that one-half of the sum of the weights lies aboe and below the sorted data.

- **Trimmed Mean**

  The average of all values after dropping a fixed number of extreme values. (Synonym: truncated mean)

- **Robust**

  Not sensitive to extreme values. (Synonym: resistant)

- **Outlier**

  A data value that is very different from most of the data. (Synonym: extreme value)

### Key Ideas

- The basic metric for location is the mean, but it can be sensitive to extreme values (outliers).
- Other metrics (median, trimmed mean) are less sensitive to outliers and unusual distributions and hence are more robust.

## Variability Metrics

### Key Terms

- **Deviations**

  The difference between the observed values and the estimate of location. (Synonyms: errors, residuals)

- **Variance**

  The sum of squared deviations from the mean divided by _n-1_ where _n_ is the number of data values. (Synonym: mean-squared error)

- **Standard Deviation**

  The square root of the variance.

- **Mean Absolute Deviation**

  The mean of the absolute values of the deviations from the mean. (Synonyms: l1-norm, Manhattan norm)

- **Median Absolute deviation from the median**

  The median of the absolute values of the deviations from the median.

- **Range**

  The difference between the largest and the smallest values in the data set.

- **Order Statistics**

  Metrics based on the data values sorted from smallest to biggest. (Synonym: rank)

- **Percentile**

  The value such that P percent of the values take on this value or less and (100-P) percent take on this value or more. (Synonym: quantile)

- **Interquartile Range**

  The difference between the 75th percentile and the 25th percentile. (Synonym: IQR)

### Key Ideas

- Variance and standard deviation are the most widespread and routinely reported statistics of variability
- Both are sensitive to outliers.
- More robust metrics include mean absolute deviation, median absolute deviation from the median, and percentiles (quantiles)

## Exploring the Distribution

### Key Terms

- **Boxplot**

  A plot introduced by Turkey as a quick way to visualize the distribution of data. (Synonym: box and whiskers plot)

- **Frequency Table**

  A tally of the count of numeric data values that fall into a set of intervals (bins)

- **Histogram**

  A plot of the frequency table with the bins on the x-axis and the count (or proportion) on the y-axis. While visually similar, bar charts should not be confused with histograms.

- **Density plot**

  A smoothed version of the histogram, often based on a _kernel density estimate_.

### Key Ideas

- A freqency histogram plots frequency counts on the y-axis and variable values on the x-axis: it gives a sense of the distribution of the data at a glance
- A frequency table is a tabular version of the frequency counts found in a histogram.
- A boxplot - with the top and bottom of the box at the 75th and 25th percentiles, respectively - also gives a quick sens of the distribution of the data; it is often used in side-by-side displays to compare distributions.
- A density plot is a smoothed version of a histogram; it requires a function to estimate a plot based on the data (multiple estimates are possible, of course)

## Exploring Categorical Data

### Key Terms

- **Mode**

  The most commonly occuring category or value in a data set.

- **Expected value**

  When the categories can be associated with a numeric value, this gives an average value based on a category's probability of occurence.

- **Bar Charts**

  The frequency or proportion for each category plotted as bars.

- **Pie Charts**

  The frequency or proportion for each category plotted as wedges in a pie.

### Key Ideas

- Categorical data is typically summed up in proportions and can be visualized in a bar chart.
- Categories might represent distinct things (apples and oranges, male and female), levels of a factor variable (low, medium, high), or numeric data that has been binned.
- Expected value is the sum of values times their probability of occurrence, often used to sum up factor variable lengths.

## Correlation

### Key Terms

- **Correlation Coefficient**

  A metric that measures the extent to which numeric variables are associated with one another (ranges from -1 to +1).

- **Correlation Matrix**

  A table where the variables are shown on both rows and columns, and the cell values are the correlations between variables.

- **Scatterplot**

  A plot in which the x-axis is the value of one variable, and the y-axis the value of another.

### Key Ideas

- The correlation coefficient measures the extent to which two paired variables (e.g. height and weight for individuals) are associated with one another.
- When high values of v1 go with high values of v2, v1 and v2 are positively associated.
- When high values of v1 go with low values of v2, v1 and v2 are negatively associated.
- The correlation coefficient is a standardized metric, so that it always ranges from -1 (perfect negative correlation) to +1 (perfect positive correlation).
- A correlation coefficient of zero indicates no correlation, but be aware that random arrangements of data will produce both positive and negative values for the correlation coefficient just by chance.

## Exploring Two or more Variables

### Key Terms

- **Contingency Table**

  A tally of counts between two eor more categorical variables.

- **Hexagonal Binning**

  A plot of two numeric variables with the records binned into hexagons.

- **Contour Plot**

  A plot showing the density of two numeric variables like a topographical map.

- **Violin Plot**

  Similar to a boxplot but showing the density estimate.

### Key Ideas

- Hexagonal binning and contour plots are useful tools that permit graphical examination of two numeric variables at a time, without being overwhelmed by huge amounts of data.
- Contingency tables are the standard tool for looking at the counts of two categorical variables.
- Boxplots and violin plots allow you to plot a numeric variable against a categorical variable.

# Chpater 2 - Data and Sampling Distributions

## T

### Key Terms

-

### Key Ideas

-

## T

### Key Terms

-

### Key Ideas

-
