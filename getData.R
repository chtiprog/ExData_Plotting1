fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# Download and unzip the data file if it does not exist already
if (!file.exists("household_power_consumption.zip")) {
  download.file(fileUrl, destfile="household_power_consumption.zip", method="curl")
  unzip("household_power_consumption.zip")
}

# Read the data
columnClasses <- c("character","character","numeric","numeric", "numeric",
                   "numeric","numeric","numeric","numeric")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",
                    colClasses=columnClasses)

# Subset the data with the only 2 dates concerned by the assignment
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Create a new column with datetime
data$DataTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")