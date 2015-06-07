# Plot 1
# Coursera - Exploratory Data Analysis

library (data.table)
library (dplyr)

energyFile <- file("household_power_consumption.txt")

# read data for 1/2/2007 - 2/2/2007 into ec
ec <- read.table(text = grep("^[1,2]/2/2007", readLines(energyFile), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)


# Generate Plot 1
hist(ec$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")

# Save plot to a file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


