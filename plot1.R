#read the data from working directory
#subset the data
#set format of date
setwd("C:/Users/victor.rotariu/Desktop/workdir/exploratory/week1")
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

#construct plot1 and save to png
hist(data1$Global_active_power, col = "red", border = "black", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.print(png,'plot1.png',width=480,height=480)
dev.off()