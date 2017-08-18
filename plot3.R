# Author: Costanzo Di Maria
# Last modified: 18/08/2017


rm(list=ls()) ## Clean workspace.

fileName <- "household_power_consumption.txt"

# Only import data corresponding to 01/02/2007 and 02/02/2007
# There are 1440 entries per day, i.e. one every minute 24*60=1440.
data_start <- 66637 ## Index of first entry with date 01/02/2007; value obtained by studying the dataset.
Nentries <- 2*1440 ## Number of lines to read in, i.e. 1440 times 2 days.

data <- read.table(fileName, header=FALSE, sep=";", na.strings="?", skip=data_start, nrows=Nentries)
names(data) <- names(read.table(fileName, header=TRUE, sep=";", nrows=1))

# Convert to date/time object
datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")



png(filename="plot3.png", width=480, heigh=480) ## Open png device

# Do plot...
par(mfrow=c(1,1)) ## Initialise new plot; just to make sure we clean possible previous settings.
plot(datetime, data$Sub_metering_1, type="l", col="black",
          xlab="", ylab="Energy sub metering")
lines(datetime, data$Sub_metering_2, col="red")
lines(datetime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off() ## Close png device

