#Read in ALL data, may need to only read in two days
table <- read.table("household_power_consumption.txt",header=TRUE, sep=";", colClasses = c(rep("character",2),rep("numeric",7)),na="?")
#Subset data for two day period DD/MM/YYYY
usefulData <- table[table$cdDate %in% c("1/2/2007","2/2/2007"),]
#Convert Time to Real World Time
dateTime <- strptime(paste(usefulData$cdDate, usefulData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#Features to be plotted
globalActivePower <- usefulData$Global_active_power
Sub_metering_1 <- usefulData$Sub_metering_1
Sub_metering_2 <- usefulData$Sub_metering_2
Sub_metering_3 <- usefulData$Sub_metering_3
Voltage <- usefulData$Voltage
Global_reactive_power <- usefulData$Global_reactive_power
#Open PNG device
png("plot4.png",width=480,height=480)
#Do plot
par(mfrow=c(2,2))
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(dateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(dateTime,Sub_metering_2,col="red")
lines(dateTime,Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=1, col=c("black", "red", "blue"),bty="n")
plot(dateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
#Turn of PNG device
dev.off()