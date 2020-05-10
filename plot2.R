#load the data and subset for the needed dates
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
datasub <- subset(data, data$Date == "2/2/2007" | data$Date == "1/2/2007")

#creating the needed Global Active Power and Dates vars in the needed format 
dates <- strptime(paste(as.character(datasub$Date), as.character(datasub$Time), sep = " "), "%d/%m/%Y %H:%M:%S") 
gap <- datasub$Global_active_power
gap <- as.numeric(as.character(gap))

#creating the png and plotting 
png("plot2.png", width = 480, height = 480)
plot(dates, gap, type = "l", ylab = "Global Active Power (kilowhatts)", xlab ="")
dev.off()