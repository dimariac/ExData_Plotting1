# Author: Costanzo Di Maria
# Last modified: 17/08/2017


rm(list=ls()) ## Clean workspace.

fileName <- "household_power_consumption.txt"

# Only import data corresponding to 01/02/2007 and 02/02/2007
# There are 1440 entries per day, i.e. one every minute 24*60=1440.
data_start <- 66637 ## Index of first entry with date 01/02/2007; value obtained by studying the dataset.
Nentries <- 2*1440 ## Number of lines to read in, i.e. 1440 times 2 days.

data <- read.table(fileName, header=FALSE, sep=";", na.strings="?", skip=data_start, nrows=Nentries)
names(data) <- names(read.table(fileName, header=TRUE, sep=";", nrows=1))



png(filename="plot1.png", width=480, heigh=480) ## Open png device

# Do plot...
par(mfrow=c(1,1)) ## Initialise new plot; just to make sure we clean possible previous settings.
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


dev.off() ## Close png device

