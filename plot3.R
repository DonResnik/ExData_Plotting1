#load the data 
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#get the subset of the dates for the plot
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# get the globalActivePower and subMetering values from the subset
globalActivePower <- as.numeric(subset$Global_active_power)
subMetering1 <- as.numeric(subset$Sub_metering_1)
subMetering2 <- as.numeric(subset$Sub_metering_2)
subMetering3 <- as.numeric(subset$Sub_metering_3)

#convert to Dat/Time class
dateTime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# create the png
png("plot3.png", width=480, height=480)

# plot the data
plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# close the file
dev.off()