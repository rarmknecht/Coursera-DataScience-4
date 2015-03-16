setwd("/mnt/truecrypt11/coding/Coursera-DataScience-4/Project 2")

library(dplyr)

# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 6
combo <- merge(NEI, SCC, by="SCC")
df.combo <- tbl_df(combo)

df.combo.motor <- filter(df.combo, grepl("vehicle",Short.Name, ignore.case=TRUE))
df.combo.group <- group_by(df.combo.motor, year, fips)
df.q6 <- df.combo.group %>% select(Emissions, year, fips, type) %>%
  filter(fips == "24510" | fips == "06037") %>%
  summarise(count=n(), pm=sum(Emissions,na.rm=TRUE))

png(file = "plot6.png", width = 640, height = 480, units = "px", bg = "white")

library(ggplot2)
g <- ggplot(df.q6, aes(year,pm))
# g + geom_point(aes(color=type),size=4,alpha=1/2) + facet_grid(.~type) + geom_smooth(method="lm", aes(color=type), se=FALSE, linetype=5) + labs(title="Baltimore Emissions by Type", y="Emissions", x="Year")
g + geom_point(aes(color=fips),size=4,alpha=1/2) + facet_grid(.~fips) + 
  geom_smooth(method="lm", aes(color=fips), se=TRUE, linetype=5) + 
  labs(title="Los Angeles (06037) vs. Baltimore (24510) -- Vehicle Emissions", y="Emissions", x="Year")

dev.off()
