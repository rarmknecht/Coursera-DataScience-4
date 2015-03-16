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

# Plot 4
# Set PNG Saving
png(file = "plot4.png", width = 480, height = 480, units = "px", bg = "white")

# Gridlines
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

# top right (plot2)
plot(fdata$datetime, fdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# top right
plot(fdata$datetime, fdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

# bottome left (plot3)
plot(fdata$datetime, fdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(fdata$datetime, fdata$Sub_metering_2, type="l", col="red")
lines(fdata$datetime, fdata$Sub_metering_3, type="l", col="blue")

legend('topright', lty = c(1, 1, 1), col = c('black', 'blue', 'red'), bty="n",
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# bottome right
plot(fdata$datetime, fdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

