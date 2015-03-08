#!/usr/bin/env Rscript

source('getData.R')

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


