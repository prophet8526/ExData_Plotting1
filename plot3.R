# This script assumes the household_power_consumption.txt file has been downloaded and extracted
# to the working directory.

rawData <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";", na.strings = "?", stringsAsFactors = FALSE)      # Read in data file
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")                                 # Format date and time columns
subData <- rawData[rawData$Date >= "2007-02-01" & rawData$Date <= "2007-02-02",]
subData$Time <- strptime(paste(subData$Date, subData$Time), "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)      # Open png graphics device and write to plot3.png
with(subData, plot(Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
lines(subData$Time, subData$Sub_metering_2, col = "red")    # Add additional data
lines(subData$Time, subData$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))    # Add legend to upper right
dev.off()                                                   # Close png graphics device