library(readr)
library(ggplot2)


#Read in the data from the website
household_power_consumption <- read.csv("~/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")



#Convert to a date to a date
household_power_consumption$Date <- as.Date(as.character(household_power_consumption$Date),format="%d/%m/%Y")

#Convert the time
household_power_consumption$Time <- as.POSIXct(paste(as.character(household_power_consumption$Date)," ",household_power_consumption$Time),format="%Y-%m-%d %H:%M:%S")


#Create the dataset with only the two days in Feb

household_power_feb<-household_power_consumption[household_power_consumption$Date < as.Date("2007-02-03") &  household_power_consumption$Date > as.Date("2007-01-31"),]



# set the output file
png(file = "plot4.png",width=480, height=480)


#Set the output range
par(mar=c(4.5, 4.5, 1, 1), mfrow=c(2, 2))

# Create the line charts

#Global Active Power
plot(household_power_feb$Time, household_power_feb$Global_active_power, type="l", lwd=1.5, col="black", main = NULL, 
          xlab="", ylab='Global Active Power (kilowatts)')

#Voltage
plot(household_power_feb$Time, household_power_feb$Voltage , type="l", lwd=1.5, col="black", main = NULL, 
     xlab="datetime", ylab='Voltage')

#Sub Meters
plot(household_power_feb$Time, household_power_feb$Sub_metering_1, type="l", lwd=1.5, col="black", main = NULL, 
     xlab="", ylab="Energy sub metering")
lines(household_power_feb$Time, household_power_feb$Sub_metering_2, type="l", lwd=1.5, col="red")
lines(household_power_feb$Time, household_power_feb$Sub_metering_3, type="l", lwd=1.5, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("Black", "Red", "Blue"), 
       lwd = 1, lty=1)
#reactive power
plot(household_power_feb$Time, household_power_feb$Global_reactive_power , type="l", lwd=1.5, col="black", main = NULL, 
     xlab="datetime", ylab='global_reactive_power')

# Save the file.
dev.off()