#!/usr/bin/env Rscript

source('getData.R')

# Create the graph in png file
png("plot3.png", width = 480, height = 480, bg = "transparent", units = "px")
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
dev.off()