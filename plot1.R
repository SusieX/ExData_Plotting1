#path="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(path,destfile="project1data",method="libcurl")
#unzip("project1data")
#It seems this download method cause problems, file format different from directly click the link? method?

#manually download data from link first:
datafile="household_power_consumption.txt"
date1=read.csv(datafile,strip.white=TRUE,fill=TRUE,quote="",sep=";",skipNul=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
head(date1,5)
str(date1)
date1$Date = as.Date(date1$Date,format="%d/%m/%Y")
filteddata=subset(date1,Date=="2007-02-02"|Date=="2007-02-01")
head(filteddata,10)

names(filteddata)

hist(filteddata$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png,"plot1.png",width = 480, height = 480)
dev.off()
