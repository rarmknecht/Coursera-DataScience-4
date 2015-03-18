# Randy Armknecht
# 
# Coursera - Getting and Cleaning Data
#
# Workbook
setwd("C:/Users/ranarm01/Documents/Github/Coursera-DataScience-4")

# Quiz 2

# Question 1 - bwplot returns a trellis object

# Question 2
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)
# A set of 3 panels showing the relationship between weight and time for each diet.

# Question 3
# Annotation of plots in any plotting system involves adding points, lines, or text to the plot, 
# in addition to customizing axis labels or adding titles. Different plotting systems have different 
# sets of functions for annotating plots in this way. Which of the following functions can be used to 
# annotate the panels in a multi-panel lattice plot?

# panel.abline()

# Question 4
library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)
print p
print(p)
# The object 'p' has not yet been printed with the appropriate print method.

# Question 5
# In the lattice system, which of the following functions can be used to finely 
# control the appearance of all lattice plots?

# print.trellis()

# Question 6
# ggplot2 is the Grammar of Graphics developed by Leland Wilkinson

# Quesiton 7
library(datasets)
data(airquality)
# I am interested in examining how the relationship between ozone and wind speed varies across each month. 
# What would be the appropriate code to visualize that using ggplot2? 
library(ggplot2)
#a -- No
qplot(Wind, Ozone, data = airquality, geom = "smooth")
# b -- Maybe (Yes)
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)
# c -- No
qplot(Wind, Ozone, data = airquality)
# d -- No, Error
qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))

# Question 8
# What is a geom in the ggplot2 system?
# a plotting object like point, line, or other shape

# Question 9
library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
print(g)
# ggplot does not yet know what type of layer to add to the plot.

# Question 10
qplot(votes, rating, data = movies)
# qplot(votes, rating, data = movies) + geom_smooth() 

