
power_data <- fread("household_power_consumption.txt", stringsAsFactors = F, header = T)
partialData <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]
#str(partialData)
datetime <- strptime(paste(partialData$Date, partialData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(partialData$Global_active_power)
globalReactivePower <- as.numeric(partialData$Global_reactive_power)
voltage <- as.numeric(partialData$Voltage)
subMetering1 <- as.numeric(partialData$Sub_metering_1)
subMetering2 <- as.numeric(partialData$Sub_metering_2)
subMetering3 <- as.numeric(partialData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering1", "Sub_metering2", "Sub_metering3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
