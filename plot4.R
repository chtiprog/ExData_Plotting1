# Read the data after unzipped the txt file
data <- read.table("household_power_consumption.txt", sep = ";", col.names = colnames(read.table("household_power_consumption.txt", sep = ";", nrows = 1, header = TRUE)), skip = 1)
# Subset the data with the only 2 dates concerned by the assignment
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
# Create a new column with datetime
data$DataTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
# format some columns
data$Sub_metering_1 <- as.character(data$Sub_metering_1)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.character(data$Sub_metering_2)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.character(data$Sub_metering_3)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.character(data$Voltage)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.character(data$Global_reactive_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
# Create the graph in png file
png("plot4.png", width = 480, height = 480, bg = "transparent", units = "px")
par(mfrow = c(2, 2))
with(data, {
  plot(data$DataTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  plot(data$DataTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(data$DataTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(data$DataTime, data$Sub_metering_2, type = "l", col = "red")
  lines(data$DataTime, data$Sub_metering_3, type = "l", col = "blue")
  legend("topright", 
        legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), 
        col = c("black", "red", "blue"), 
        lwd = .75, 
        cex = .75
  )
  plot(data$DataTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.off()


