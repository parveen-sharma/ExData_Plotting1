###########################
## Author: Parveen Sharma
## Date: 2015-06-02
## Exploratory Data Analysis
## Assignment: Course Project 1 | Task: plot3
##########################

## set working directory - where data file is downloaded
## plots are also saved here
setwd("C:/Users/Parveen/Desktop/r-prog/assign-ExploratoryDataAnalysis/study2/")

## read data for specific dates only
library(sqldf)
reader <- read.csv.sql("household_power_consumption.txt",sql="select * from file where Date in ('1/2/2007','2/2/2007') ", header=T, sep=";", eol = "\n")

## combine date and time into one-variable for use
library(lubridate)
reader$date_time <- dmy_hms(paste(reader$Date,reader$Time, sep=" "))

## plot3
png(file="plot3.png", width=480, height=480, units="px", bg="white")
  yrange<-range(c(reader$Sub_metering_1,reader$Sub_metering_2,reader$Sub_metering_3))
  plot(reader$date_time, reader$Sub_metering_1, type="l", col="grey20", ylim=yrange, ylab="Energy sub metering", xlab="")
  par(new=T)
  plot(reader$date_time, reader$Sub_metering_2, type="l", col="red", ylim=yrange, ylab="", xlab="")
  par(new=T)
  plot(reader$date_time, reader$Sub_metering_3, type="l", col="blue", ylim=yrange, ylab="", xlab="")
  legend("topright", pch="_", col=c("grey20", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
