setwd("/mnt/truecrypt11/coding/Coursera-DataScience-4/Project 2")

library(dplyr)

# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 2
df <- tbl_df(NEI)
yrs <- c(1999, 2002, 2005, 2008)
total <- c(0,0,0,0)
df.new <- data.frame(yrs,total)

# filter(df, type != "POINT", type != "ON-ROAD", type != "NONPOINT", type != "NON-ROAD")
df.group <- group_by(df, year, type)
df.q3 <- df.group %>% select(Pollutant, Emissions, year, fips, type) %>% filter(fips == "24510") %>% summarise(count=n(), pm = sum(Emissions, na.rm = TRUE))
df.q3

png(file = "plot3.png", width = 640, height = 480, units = "px", bg = "white")

library(ggplot2)

g <- ggplot(df.q3, aes(year,pm))
g + geom_point(aes(color=type),size=4,alpha=1/2) + facet_grid(.~type) + geom_smooth(method="lm", aes(color=type), se=FALSE, linetype=5) + labs(title="Baltimore Emissions by Type", y="Emissions", x="Year")

dev.off()
