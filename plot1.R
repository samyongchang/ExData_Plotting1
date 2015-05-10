##Put the extracted data in the working directory first
##Reads the data
data <- read.table("household_power_consumption.txt", na.strings = "?", header=TRUE, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

##Selects the data for only the 2  days in 2007-02-01 and 2007-02-02
data1 <-subset(data,data$Date>="2007-02-01" & data$Date <="2007-02-02")
##Sets the Global Active Power variable as numeric
data1$Global_active_power <- as.numeric(data1$Global_active_power)
##Create the plot
png(file="plot1.png", width = 480, height = 480)
hist(data1$Global_active_power, main = paste("Global Active Power"),xlab="Global Active Power (kilowatts)", col="red")
dev.off()

