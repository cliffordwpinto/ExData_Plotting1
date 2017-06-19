
# Read file
power_data <- fread("household_power_consumption.txt", stringsAsFactors = F, header = T)
#Get one month worth of data
partialData <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(partialData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



power_data <- fread("household_power_consumption.txt", stringsAsFactors = F, header = T)
partialData <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(partialData $Date, partialData $Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(partialData $Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
