# This script assumes the household_power_consumption.txt file has been downloaded and extracted
# to the working directory.

rawData <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";", na.strings = "?", stringsAsFactors = FALSE)      # Read in data file
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")                                 # Format date and time columns
subData <- rawData[rawData$Date >= "2007-02-01" & rawData$Date <= "2007-02-02",]
subData$Time <- strptime(paste(subData$Date, subData$Time), "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)      # Open png graphics device and write to plot2.png
with(subData, plot(Time, Global_active_power, xlab = "", 
                   ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()                                                   # Close png graphics device

