## script for plot4.
##
## subsetting data for dates 2007-02-01 and 2007-02-02
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
##
## plot4 script
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)
Voltage <- as.numeric(subsetdata$Voltage)
Sub_Metering_1 <- as.numeric(subsetdata$Sub_metering_1)
Sub_Metering_2 <- as.numeric(subsetdata$Sub_metering_2)
Sub_Metering_3 <- as.numeric(subsetdata$Sub_metering_3)
GlobalReactivePower <- as.numeric(subsetdata$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
## plot 4.1
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
## plot 4.2
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
## plot 4.3
plot(datetime, Sub_Metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, Sub_Metering_2, type="l", col="red")
lines(datetime, Sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
## plot 4.4
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

