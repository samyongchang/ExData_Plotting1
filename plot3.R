##Put the extracted data in the working directory first
##Reads the data
data <- read.table("household_power_consumption.txt", na.strings = "?", header=TRUE, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

##Selects the data for only the 2  days in 2007-02-01 and 2007-02-02
data1 <-subset(data,data$Date>="2007-02-01" & data$Date <="2007-02-02")

##Sets the Sub metering variables as numeric
data1$Sub_metering_1 <-as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2 <-as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3 <-as.numeric(data1$Sub_metering_3)

##Merges data and time to create a variable
data1$datetime <- as.POSIXct(paste(data1$Date, data1$Time))

##Create the plot
png(file="plot3.png", width = 480, height = 480)
plot(data1$Sub_metering_1~data1$datetime, type="l", xlab="", ylab="Energy sub metering")
lines(data1$Sub_metering_3~data1$datetime, col="blue")
lines(data1$Sub_metering_2~data1$datetime, col="red")


legend("topright", col=c("black","red","blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



dev.off()
