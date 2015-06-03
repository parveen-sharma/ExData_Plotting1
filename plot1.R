###########################
## Author: Parveen Sharma
## Date: 2015-06-02
## Exploratory Data Analysis
## Assignment: Course Project 1 | Task: plot1
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

## plot1
png(file="plot1.png", width=480, height=480, units="px", bg="white")
  hist(reader$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()
