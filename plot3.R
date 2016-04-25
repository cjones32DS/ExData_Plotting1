#Read in ALL data, may need to only read in two days
table <- read.table("household_power_consumption.txt",header=TRUE, sep=";", colClasses = c(rep("character",2),rep("numeric",7)),na="?")
#Subset data for two day period DD/MM/YYYY
usefulData <- table[table$cdDate %in% c("1/2/2007","2/2/2007"),]
#Convert Time to Real World Time
dateTime <- strptime(paste(usefulData$cdDate, usefulData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#Features to be plotted
Sub_metering_1 <- usefulData$Sub_metering_1
Sub_metering_2 <- usefulData$Sub_metering_2
Sub_metering_3 <- usefulData$Sub_metering_3
#Open PNG device
png("plot3.png",width=480,height=480)
#Do plot
plot(dateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(dateTime,Sub_metering_2,col="red")
lines(dateTime,Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#Turn of PNG device
dev.off()