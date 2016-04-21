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
png("plot4.png", width=480, height=480)

# create the 2x2 matrix for the four plots
par(mfcol = c(2, 2)) 

# add the upper left plot
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# add the lower left plot
plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# add the upper right plot
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

#add the lower right plot
plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# close the file
dev.off()