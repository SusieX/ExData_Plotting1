datafile="household_power_consumption.txt"
date1=read.csv(datafile,strip.white=TRUE,fill=TRUE,quote="",sep=";",skipNul=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
head(date1,5)
str(date1)
Dat = as.Date(date1$Date,format="%d/%m/%Y")
filteddata=subset(date1,Dat=="2007-02-02"|Dat=="2007-02-01")

head(filteddata,10)
names(filteddata)
library(lubridate)
library(data.table)
filteddata=data.table(filteddata)
is.data.table(filteddata)


#combine date and time, create a new column DT, transform 
filteddata[,DT:=paste(filteddata$Date,filteddata$Time)]
DateTime=strptime(filteddata$DT,format="%d/%m/%Y %H:%M:%S")

plot(DateTime,filteddata$Sub_metering_1, ylab="Energy sub metering",xlab="",type="l",col="grey")
lines(DateTime,filteddata$Sub_metering_2, ylab="Energy sub metering",xlab="",col="red")
lines(DateTime,filteddata$Sub_metering_3, ylab="Energy sub metering",xlab="",col="blue")
legend("topright",lwd=2, col=c("grey","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,"plot3.png")
dev.off()