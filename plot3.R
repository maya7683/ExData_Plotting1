# load data
all_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# subset data from 2007-02-01 and 2007-02-01
data <- all_data[(all_data$Date == "1/2/2007") | (all_data$Date == "2/2/2007"),]

# format date and time
data$DT <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data$Global_active_power <- as.numeric(as.character(data$Sub_metering_1))
data$Global_active_power <- as.numeric(as.character(data$Sub_metering_2))
data$Global_active_power <- as.numeric(as.character(data$Sub_metering_3))

png(filename = "plot3.png", width = 480, height = 480)
plot(data$DT, data$Sub_metering_1,type='l',col="black",xlab="",ylab="Energy sub metering")
lines(data$DT, data$Sub_metering_2,col="red")
lines(data$DT, data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),lty=1)
dev.off()