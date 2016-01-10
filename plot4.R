# This script assumes the household_power_consumption.txt file has been downloaded and extracted
# to the working directory.

rawData <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";", na.strings = "?", stringsAsFactors = FALSE)      # Read in data file
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")                                 # Format date and time columns
subData <- rawData[rawData$Date >= "2007-02-01" & rawData$Date <= "2007-02-02",]
subData$Time <- strptime(paste(subData$Date, subData$Time), "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)    # Open png graphics device and write to plot4.png
par(mfrow = c(2,2))

# Plot 1
with(subData, plot(Time, Global_active_power, xlab = "", 
                   ylab = "Global Active Power", type = "l"))

# Plot 2
with(subData, plot(Time, Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))

# Plot 3
with(subData, plot(Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
lines(subData$Time, subData$Sub_metering_2, col = "red")
lines(subData$Time, subData$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# Plot 4
with(subData, plot(Time, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l"))
dev.off()                                                 # Close png graphics device