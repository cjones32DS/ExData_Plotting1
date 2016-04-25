#Read in ALL data, may need to only read in two days
table <- read.table("household_power_consumption.txt",header=TRUE, sep=";", colClasses = c(rep("character",2),rep("numeric",7)),na="?")
#Subset data for two day period DD/MM/YYYY
usefulData <- table[table$cdDate %in% c("1/2/2007","2/2/2007"),]
#Convert Time to Real World Time
dateTime <- strptime(paste(usefulData$cdDate, usefulData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#Feature to be binned
globalActivePower <- usefulData$Global_active_power
#Open PNG device
png("plot2.png",width=480,height=480)
#Do plot
plot(dateTime,globalActivePower,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#Turn of PNG device
dev.off()