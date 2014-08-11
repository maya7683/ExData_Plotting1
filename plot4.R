source("load_data.R")


plot4 <- function() {
  
  # Make smaller data set if needed
  if(!file.exists('input_data.rds'))
    load_data()
  
  # Load dataset
  input_data <- readRDS("input_data.rds")
  
  # Create plot file
  png("plot4.png", width=480, height=480)
  
  # Make plot
  par(mfrow=c(2,2))
  # UL
  plot(input_data$DT, input_data$GLOBAL_ACT_PWR,
       type="l",
       xlab="",
       ylab="Global Active Power")
  # UR
  plot(input_data$DT, input_data$VOLTAGE, type="l",
       xlab="datetime", ylab="Voltage")
  # LL
  plot(input_data$DT, input_data$SM1, type="l", col="black",
       xlab="", ylab="Energy sub metering")
  lines(input_data$DT, input_data$SM2, col="red")
  lines(input_data$DT, input_data$SM3, col="blue")
  legend("topright",
         col=c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1,
         box.lwd=0)
  # LR
  plot(input_data$DT, input_data$GLOBAL_REACT_PWR, type="n",
       xlab="datetime", ylab="Global_reactive_power")
  lines(input_data$DT, input_data$GLOBAL_REACT_PWR)
  
  # Save and close file
  dev.off()
  
}