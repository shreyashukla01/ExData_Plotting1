
##load and execute readData.R
## creating png file
png("plot4.png")

## setting frame accordingly
par(mfrow=c(2,2), mar=c(4,4,2,1))

##command to create required plot
with(result,{plot(DateTime,result$Global_active_power,ylab="Global Active Power",xlab="",type="l");
  plot(DateTime,result$Voltage,ylab="Voltage",xlab="datetime",type="l");
  with(result,plot(result$Date, result$Sub_metering_1,type="l",ylab="Enery sub metering",xlab = ""));
  with(result,points(result$Date, result$Sub_metering_2,type="l",col="red"));
  with(result,points(result$Date, result$Sub_metering_3,type="l",col="blue"));
  legend("topright",pch = '-',col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n");
  plot(DateTime,result$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l");
})

## closing the device
dev.off()