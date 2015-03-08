#!/usr/bin/env Rscript

source('getData.R')
# Create the graph in png file
png("plot1.png", width = 480, height = 480, bg = "transparent", units = "px")
plot1 <- hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
