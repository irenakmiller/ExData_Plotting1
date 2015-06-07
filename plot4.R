# Plot 4
# Coursera - Exploratory Data Analysis

# Get the full dataset
energyFile <- file("household_power_consumption.txt")

fullData <- read.csv(energyFile, header = T, sep = ';', 
                     na.strings = "?", nrows = 2075259, check.names = F, 
                     stringsAsFactors = F, comment.char = "", quote = '\"')

# Format the date
fullData$Date <- as.Date(fullData$Date, format = "%d/%m/%Y")

# Subset the data
data <- subset(fullData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fullData)

# Convert the dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Generate Plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
        plot(Global_active_power ~ Datetime, type = "l", 
             ylab = "Global Active Power", xlab = "")
        plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
             xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = 'Red')
        lines(Sub_metering_3 ~ Datetime, col = 'Blue')
        legend("topright",  cex=0.25, col = c("black", "red", "blue"), lty = 1, lwd = 2, 
               bty = "n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power ~ Datetime, type = "l", 
             ylab = "Global_rective_power", xlab = "datetime")
})

# Save plot to a file
dev.copy(png, file="plot.png", height=480, width=480)
dev.off()
