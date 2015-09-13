#plot3.R
#Exploratory Data Analysis, Project 1, plot 3

library(dplyr)

#Set working directory, specifies the location of your working directory
setwd("Specify working directory")

#open data
ds <- read.table("data/household_power_consumption.txt", header = TRUE, sep=";",
                 colClasses=c("character","character",rep("numeric",7)), na.strings="?")
str(ds)

#Keep only records in 2007-02-01 and 2007-02-02
subDS <- filter(ds, Date=="1/2/2007" | Date=="2/2/2007")

#convert Date and time to date and time objects
subDS$Time <- paste(subDS$Date, subDS$Time)
subDS$Time <- strptime(subDS$Time, "%d/%m/%Y %H:%M:%S")
subDS$Date <- as.Date(subDS$Date, "%d/%m/%Y")

#plot directtly to png graphics device
png(filename="plot3.png", width=480, height=480, units="px")

plot(subDS$Time,subDS$Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering")
lines(subDS$Time,subDS$Sub_metering_2, type="l", col="red")
lines(subDS$Time,subDS$Sub_metering_3, type="l", col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),
       lty=1)

dev.off()
