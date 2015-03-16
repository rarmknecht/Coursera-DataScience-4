# Randy Armknecht
# 
# Coursera - Exploratory Data
#
# Workbook
setwd("C:/Users/ranarm01/Documents/Github/ExData_Plotting1")

library(dplyr)

# Load the data
path2csv = "household_power_consumption.txt"
delim=";"
dec="."
df <- read.csv(path2csv, sep=delim, dec=dec, stringsAsFactors=FALSE)
df[, 3] <- as.numeric(df[,3])
df[,4] <- as.numeric(df[,4])
df[,5] <- as.numeric(df[,5])
df[,6] <- as.numeric(df[,6])
df[,7] <- as.numeric(df[,7])
df[,8] <- as.numeric(df[,8])

raw <- tbl_df(df)
rm("df")

# Filter to feb 1 & 2 in 2007
fdata <- raw %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

# Plot 1
# Set PNG Saving
png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "white")

hist(fdata$Global_active_power, 
     col="red",
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power",
     ylim=c(0,1200))

dev.off()

