#plot1.R
#Exploratory Data Analysis, Project 1, plot 1

library(dplyr)

#Set working directory, specifies the location of your working directory
setwd("C:/Users/BillibaldoMartinezAr/Documents/Coursera_ExploratoryDataAnalysis/ExData_Plotting1.git/trunk")

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

#Build graph
#Global active power
hist(subDS$Global_active_power,col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(device=png,filename="plot1.png", width=480, height=480)
dev.off ()