#load the data 
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#get the subset of the dates for the plot
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# get the globalActivePower values from the subset
globalActivePower <- as.numeric(subset$Global_active_power)

# create the png file
png("plot1.png", width=480, height=480)

# plot the data to the file
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close the file
dev.off()
