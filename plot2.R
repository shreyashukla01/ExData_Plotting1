
##load and execute readData.R
## creating png file
png("plot2.png")

##command to create required plot
plot(result$Date,as.numeric(result$Global_active_power),type = "l", ylab = "Global Active Power (killowatts)",xlab="")

## closing the device
dev.off()