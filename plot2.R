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
## Create a line chart then copy to a png file
with(HPData, plot(Datetime,Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off()
