# Plot 2
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

# Generate Plot 2
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
