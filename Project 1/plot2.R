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

# Plot 2
# Set PNG Saving
png(file = "plot2.png", width = 480, height = 480, units = "px", bg = "white")

plot(fdata$datetime, fdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

