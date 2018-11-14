## script for plot3.
##
## subsetting data for dates 2007-02-01 and 2007-02-02
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
## plot3 script
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub_Metering_1 <- as.numeric(subsetdata$Sub_metering_1)
Sub_Metering_2 <- as.numeric(subsetdata$Sub_metering_2)
Sub_Metering_3 <- as.numeric(subsetdata$Sub_metering_3)
##
png("plot3.png", width=480, height=480)
plot(datetime, Sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_Metering_2, type="l", col="red")
lines(datetime, Sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()
