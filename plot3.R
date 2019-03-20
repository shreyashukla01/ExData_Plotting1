##load and execute readData.R

## creating png file
png("plot3.png")

##command to create required plot
with(result,plot(result$Date, result$Sub_metering_1,type="l",ylab="Enery sub metering",xlab = ""))
with(result,points(result$Date, result$Sub_metering_2,type="l",col="red"))
with(result,points(result$Date, result$Sub_metering_3,type="l",col="blue"))
legend("topright",pch = '-',col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## closing the device
dev.off()