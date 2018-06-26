library(lubridate)
hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
hpc_shorty <- hpc[dmy(hpc$Date) == "2007-02-01" | dmy(hpc$Date) == "2007-02-02",]

hpc_shorty$date_time <- dmy_hms(paste(hpc_shorty$Date, hpc_shorty$Time, sep = " "))

par(mfrow = c(2, 2))

plot(hpc_shorty$date_time, 
     hpc_shorty$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

plot(hpc_shorty$date_time,
     hpc_shorty$Voltage, 
     type = "l",
     xlab = "",
     ylab = "Voltage")

plot(hpc_shorty$date_time, 
     as.numeric(as.character(hpc_shorty$Sub_metering_1)), 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(hpc_shorty$date_time, 
      as.numeric(as.character(hpc_shorty$Sub_metering_2)), 
      type = "l", 
      col = "red")
lines(hpc_shorty$date_time, 
      hpc_shorty$Sub_metering_3, 
      type = "l", 
      col = "blue")
legend("topright",
       lty = 1, 
       col=c("black","red","blue"),
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

plot(hpc_shorty$date_time,
     as.numeric(as.character(hpc_shorty$Global_reactive_power)), 
     type = "l",
     xlab = "",
     ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()