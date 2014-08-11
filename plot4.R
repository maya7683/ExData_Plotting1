# load data
all_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# subset data from 2007-02-01 and 2007-02-01
data <- all_data[(all_data$Date == "1/2/2007") | (all_data$Date == "2/2/2007"),]

# format date and time
data$DT <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

# create plot file
png("plot4.png", width=480, height=480)
  
# make plot
par(mfrow=c(2,2))
# upper left
plot(data$DT,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")
# upper right
plot(data$DT, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
# lower left
plot(data$DT, data$Sub_metering_1,type='l',col="black",xlab="",ylab="Energy sub metering")
lines(data$DT, data$Sub_metering_2,col="red")
lines(data$DT, data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),lty=1)
# lower right
plot(data$DT,data$Global_reactive_power,type="l",xlab="",ylab="Global Reactive Power")
# Save and close file
dev.off()
