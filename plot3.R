
# Read file
power_data <- fread("household_power_consumption.txt", stringsAsFactors = F, header = T)
#Get one month worth of data
partialData <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(partialData$Date, partialData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(partialData$Global_active_power)
subMetering1 <- as.numeric(partialData$Sub_metering_1)
subMetering2 <- as.numeric(partialData$Sub_metering_2)
subMetering3 <- as.numeric(partialData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Sub  metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering1", "Sub_metering2", "Sub_metering3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
