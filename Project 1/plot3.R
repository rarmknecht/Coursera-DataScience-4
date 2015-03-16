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
df <- read.csv(path2csv, sep=delim, dec=dec, stringsAsFactors=FALSE, na.strings="?",
               colClasses=c("character", "character", "numeric", "numeric", 
                            "numeric", "numeric", "numeric", "numeric", "numeric"))

raw <- tbl_df(df)
rm("df")

# Filter to feb 1 & 2 in 2007
fdata <- raw %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

# Pred the Date to be plotable
fdata$Date = as.Date(fdata$Date, format="%d/%m/%Y")
datetime <- paste(fdata$Date, fdata$Time)
fdata$datetime <- as.POSIXct(datetime)

# Plot 3
# Set PNG Saving
png(file = "plot3.png", width = 480, height = 480, units = "px", bg = "white")

plot(fdata$datetime, fdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(fdata$datetime, fdata$Sub_metering_2, type="l", col="red")
lines(fdata$datetime, fdata$Sub_metering_3, type="l", col="blue")

legend('topright', lty = c(1, 1, 1), col = c('black', 'blue', 'red'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()

