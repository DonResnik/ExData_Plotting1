#load the data 
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#get the subset of the dates for the plot
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# get the globalActivePower values from the subset
globalActivePower <- as.numeric(subset$Global_active_power)

#convert to Dat/Time class
dateTime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# create the png file
png("plot2.png", width=480, height=480)

# plot the data to the file
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close the file
dev.off()