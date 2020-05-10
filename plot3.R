#load the data and subset for the needed dates
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
datasub <- subset(data, data$Date == "2/2/2007" | data$Date == "1/2/2007")

#create a dates var in the dates format 
dates <- strptime(paste(as.character(datasub$Date), as.character(datasub$Time), sep = " "), "%d/%m/%Y %H:%M:%S") 

#get the three sub metering values
s1 <- as.numeric(as.character(datasub$Sub_metering_1))
s2 <- as.numeric(as.character(datasub$Sub_metering_2))
s3 <- as.numeric(as.character(datasub$Sub_metering_3))

#intiating a png and plotting 
png("plot3.png", width = 480, height = 480)
plot(dates, s1, type = "l", ylab = "Energy sub metering", xlab ="")
points(dates, s2, type = "l", col = "red")
points(dates, s3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()