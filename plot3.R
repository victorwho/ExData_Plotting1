#read the data from working directory
#subset the data


setwd("C:/Users/victor.rotariu/Desktop/workdir/exploratory/week1")
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

#datetime conversion
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#construct plot3 with Sub metering 1
plot(datetime,data1$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")

#add lines for Sub metering 2 and 3
lines(datetime, data1$Sub_metering_2,type="l",col="red")
lines(datetime, data1$Sub_metering_3,type="l",col="blue")

#add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red", "blue"))

#save to png
dev.print(png,'plot3.png',width=480,height=480)
dev.off()