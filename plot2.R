data <- read.table("household_power_consumption.txt", sep = ";", col.names = colnames(read.table("household_power_consumption.txt", sep = ";", nrows = 1, header = TRUE)), skip = 1)
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
data$DataTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480, units = "px")
plot(data$DataTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()