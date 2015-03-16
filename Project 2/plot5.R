setwd("/mnt/truecrypt11/coding/Coursera-DataScience-4/Project 2")

library(dplyr)

# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 5
combo <- merge(NEI, SCC, by="SCC")
df.combo <- tbl_df(combo)

df.combo.motor <- filter(df.combo, grepl("vehicle",Short.Name, ignore.case=TRUE))
df.combo.group <- group_by(df.combo.motor, year, fips)
df.q5 <- df.combo.group %>% select(Emissions, year, fips, type) %>%
  filter(fips == "24510") %>%
  summarise(count=n(), pm=sum(Emissions,na.rm=TRUE))

png(file = "plot5.png", width = 640, height = 480, units = "px", bg = "white")

library(ggplot2)
g <- ggplot(df.q5, aes(year,pm))
# g + geom_point(aes(color=type),size=4,alpha=1/2) + facet_grid(.~type) + geom_smooth(method="lm", aes(color=type), se=FALSE, linetype=5) + labs(title="Baltimore Emissions by Type", y="Emissions", x="Year")
g + geom_point(size=4,alpha=1/2) + geom_smooth(method="lm", se=TRUE, linetype=5) + labs(title="Baltimore Vehicle Emissions", y="Emissions", x="Year")

dev.off()
