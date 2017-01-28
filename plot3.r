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
par(mfrow=c(1,1))
#create plot
plot(data_filtered$datetime,data_filtered$Sub_metering_1,type="n",xlab="",ylab = "Energy sub metering")
lines(data_filtered$datetime,data_filtered$Sub_metering_1)
lines(data_filtered$datetime,data_filtered$Sub_metering_2,col="red")
lines(data_filtered$datetime,data_filtered$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,legend = c("1","2","3"))
#save as png with size 480x480
dev.copy(png,file="plot3.png",width = 480, height = 480)
dev.off()


