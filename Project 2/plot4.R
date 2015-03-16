setwd("/mnt/truecrypt11/coding/Coursera-DataScience-4/Project 2")

library(dplyr)

# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 4
combo <- merge(NEI, SCC, by="SCC")
df.combo <- tbl_df(combo)

df.combo.coal <- filter(df.combo, grepl("coal",Short.Name, ignore.case=TRUE))
df.combo.group <- group_by(df.combo.coal, year)
df.q4 <- df.combo.group %>% select(Emissions, year) %>% summarise(count=n(), pm=sum(Emissions,na.rm=TRUE))

png(file = "plot4.png", width = 640, height = 480, units = "px", bg = "white")

library(ggplot2)

g <- ggplot(df.q4, aes(year,pm))
g + geom_point(size=4,alpha=1/2) + geom_smooth(method="lm", se=TRUE, linetype=5) + labs(title="Coal Related Emissions", y="Emissions", x="Year")

dev.off()
