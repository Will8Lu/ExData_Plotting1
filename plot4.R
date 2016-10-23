
## Unzip the downloaded zip file in current working directory
unzip("household_power_consumption.zip")
## Read the text file into R
file.info("household_power_consumption.txt")$size
PowerData<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = F)
##Keep the data in date 01/02/2007 and 02/02/2007
HPData<-PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007"),]
##Remove the full dataset to release space in memory
rm(PowerData)

##Converting date and time
HPData$Date <- as.Date(HPData$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(HPData$Date), HPData$Time)
HPData$Datetime <- as.POSIXct(datetime)

## Produce a png file, name it to plot 4
png("plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
## plot the top left graph
with(HPData, plot(Datetime,Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
## Plot the top right graph
with(HPData, plot(Datetime,Voltage, type="l", xlab = "datetime", ylab = "Voltage"))
##Plot bottom left graph
plot(HPData$Datetime, HPData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(HPData$Datetime, HPData$Sub_metering_2, type = "l", col="red")
lines(HPData$Datetime, HPData$Sub_metering_3, type = "l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1,lwd = 2.5,col=c("black","red","blue"))
##Plot bottom right graph
with(HPData, plot(Datetime,Global_reactive_power, type="l"))
dev.off()

