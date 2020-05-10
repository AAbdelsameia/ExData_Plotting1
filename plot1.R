#load the data and subset for the needed dates
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
datasub <- subset(data, data$Date == "2/2/2007" | data$Date == "1/2/2007")

#create the needed Global Active Power var
gap <- datasub$Global_active_power
gap <- as.numeric(as.character(gap))

#creating the png and plotting 
png("plot1.png", width = 480, height = 480)
hist(gap, breaks = 25, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")
dev.off()