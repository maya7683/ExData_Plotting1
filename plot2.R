# load data
all_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# subset data from 2007-02-01 and 2007-02-01
data <- all_data[(all_data$Date == "1/2/2007") | (all_data$Date == "2/2/2007"),]

# format date and time
data$DT <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

png(filename = "plot2.png", width = 480, height = 480)
plot(data$DT,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()