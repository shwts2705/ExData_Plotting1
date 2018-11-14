## script for plot2.
##
## subsetting data for dates 2007-02-01 and 2007-02-02
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
## plot2 script
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

