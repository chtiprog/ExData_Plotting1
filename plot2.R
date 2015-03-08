#!/usr/bin/env Rscript

source('getData.R')

# Create the graph in png file
png("plot2.png", width = 480, height = 480, bg = "transparent", units = "px")
plot(data$DataTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()