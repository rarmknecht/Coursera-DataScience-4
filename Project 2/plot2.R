setwd("/mnt/truecrypt11/coding/Coursera-DataScience-4/Project 2")
setwd("C:/Users/ranarm01/Documents/Github/Coursera-DataScience-4/Project 2")

library(dplyr)

# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 2
df <- tbl_df(NEI)
yrs <- c(1999, 2002, 2005, 2008)
total <- c(0,0,0,0)
df.new <- data.frame(yrs,total)

df.new$total[1] <- df %>% select(Pollutant, Emissions, year, fips) %>% filter(year == 1999, fips == "24510") %>% select(Emissions) %>% sum()
df.new$total[2] <- df %>% select(Pollutant, Emissions, year, fips) %>% filter(year == 2002, fips == "24510") %>% select(Emissions) %>% sum()
df.new$total[3] <- df %>% select(Pollutant, Emissions, year, fips) %>% filter(year == 2005, fips == "24510") %>% select(Emissions) %>% sum()
df.new$total[4] <- df %>% select(Pollutant, Emissions, year, fips) %>% filter(year == 2008, fips == "24510") %>% select(Emissions) %>% sum()

png(file = "plot2.png", width = 640, height = 480, units = "px", bg = "white")
with(df.new, plot(yrs, total, main="Baltimore Total Emissions by Years"))
model <- lm(total ~ yrs, df.new)
abline(model, lwd=2)
dev.off()
