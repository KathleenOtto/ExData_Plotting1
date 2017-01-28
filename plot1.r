#translate data
data<-read.csv("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?")
#format date
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
#filter for 1&2 Feb 2007
data_filtered<-subset(data,data$Date=="2007-02-01"|data$Date=="2007-02-02")
#define plot area
par(mfrow=c(1,1))
#create histogram
hist(data_filtered$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")
#save as png with size 480x480
dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()


