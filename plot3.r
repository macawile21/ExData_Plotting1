#READ,CLEAN AND ORGANIZE DATA

data = read.table(paste(getwd(),"household_power_consumption.txt",sep="/"),sep =";",na.strings = "?",header = TRUE)
na.omit(data)
data[complete.cases(data),]
data$Date=as.Date(data$Date,"%d/%m/%Y")	
data_filtered=data[data$Date=='2007-02-01',]
data_filtered_2=data[data$Date=='2007-02-02',]
d2= rbind(data_filtered,data_filtered_2)
dateTime=paste(d2$Date,d2$Time)
dateTime = as.POSIXct(dateTime,tz = "GMT+8")
d2=cbind(dateTime,d2)

#PLOT TO FILE DEVICE

png(filename ="plot3.png",width=480,height=480)
plot(d2$dateTime,d2$Sub_metering_1,type="l",xlab = "",ylab ="Energy sub metering")
lines(d2$dateTime,d2$Sub_metering_2,col="red")
lines(d2$dateTime,d2$Sub_metering_3,col="blue")
legend("topright",col = c("black","red","blue"),legend = c
       ("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 1)
dev.off()
