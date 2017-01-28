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
globalActivePower <- as.numeric(data_filtered$Global_active_power)
plot(data_filtered$datetime,globalActivePower,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
#save as png with size 480x480
dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off()


