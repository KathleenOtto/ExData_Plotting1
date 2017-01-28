#translate data
data<-read.csv("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?")
#format date
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
#filter for 1&2 Feb 2007
data_filtered<-subset(data,data$Date=="2007-02-01"|data$Date=="2007-02-02")
#format time
datetime <- paste(as.Date(data_filtered$Date), data_filtered$Time)
data_filtered$datetime <- as.POSIXct(datetime)
#define plot area
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
#create plot#1
datetime <- paste(as.Date(data_filtered$Date), data_filtered$Time)
data_filtered$datetime <- as.POSIXct(datetime)
globalActivePower <- as.numeric(data_filtered$Global_active_power)
plot(data_filtered$datetime,globalActivePower,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
#create plot#2
Voltage <- as.numeric(data_filtered$Voltage)
plot(data_filtered$datetime,Voltage,type="l",xlab="datetime",ylab = "Voltage")
#create plot#3
plot(data_filtered$datetime,data_filtered$Sub_metering_1,type="n",xlab="",ylab = "Energy sub metering")
lines(data_filtered$datetime,data_filtered$Sub_metering_1)
lines(data_filtered$datetime,data_filtered$Sub_metering_2,col="red")
lines(data_filtered$datetime,data_filtered$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,legend = c("1","2","3"),y.intersp=.8)
#create plot#4
globalReactivePower <- as.numeric(data_filtered$Global_reactive_power)
plot(data_filtered$datetime,globalReactivePower,type="l",xlab="datetime",ylab = "Global_reactive_power")
#save as png with size 480x480
dev.copy(png,file="plot4.png",width = 480, height = 480)
dev.off()

