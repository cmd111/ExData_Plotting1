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
png(file = "plot2.png",width=480, height=480)

# Create the line chart


plot(household_power_feb$Time, household_power_feb$Global_active_power, type="l", lwd=1.5, col="black", main = NULL, 
     
     xlab="", ylab='Global Active Power (kilowatts)')


# Save the file.
dev.off()