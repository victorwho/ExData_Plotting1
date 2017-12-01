#read the data from working directory
#subset the data
setwd("C:/Users/victor.rotariu/Desktop/workdir/exploratory/week1")
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

#datetime conversion
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#construct plot2 and save to png
plot(datetime,data1$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.print(png,'plot2.png',width=480, height=480)
dev.off()