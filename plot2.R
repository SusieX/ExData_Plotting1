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
plot(DateTime,filteddata$Global_active_power, ylab="Global Active Power(kilowatts)",xlab="",type="l")
dev.copy(png,"plot2.png",width = 480, height = 480)
dev.off()

