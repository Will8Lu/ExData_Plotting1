## Unzip the downloaded zip file in current working directory
unzip("household_power_consumption.zip")
## Read the text file into R
file.info("household_power_consumption.txt")$size
PowerData<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = F)
##Keep the data in date 01/02/2007 and 02/02/2007
HPData<-PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007"),]
##Remove the full dataset to release space in memory
rm(PowerData)
## Create Plot 1 and save as a png file
GlobalActivePower<-as.numeric(HPData$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(GlobalActivePower, col="red", xlab="Global Active Power (kilowatts)" ,main = "Global Active Power")
dev.off()