## script for plot1.
## subsetting data for dates 2007-02-01 and 2007-02-02
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
subsetdata <- as.numeric(subsetdata$Global_active_power)
## plot script
png("plot1.png", width=480, height=480)
hist(subsetdata, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()

