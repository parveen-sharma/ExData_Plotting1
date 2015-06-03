###########################
## Author: Parveen Sharma
## Date: 2015-06-02
## Exploratory Data Analysis
## Assignment: Course Project 1 | Task: plot2
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

## plot2
png(file="plot2.png", width=480, height=480, units="px", bg="white")
  plot(reader$date_time, reader$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
