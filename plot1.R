##load and execute readData.R
## creating png file
png("plot1.png")

##command to create required plot
hist(as.numeric(result$Global_active_power),col="red",main="Global Active Power",xlab = "Global Active Power (killowatts)", ylab = "Frequency")

## closing the device
dev.off()