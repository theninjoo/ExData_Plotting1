library(lubridate)
hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
hpc_shorty <- hpc[dmy(hpc$Date) == "2007-02-01" | dmy(hpc$Date) == "2007-02-02",]

hpc_shorty$date_time <- dmy_hms(paste(hpc_shorty$Date, hpc_shorty$Time, sep = " "))

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

dev.copy(png, file = "plot3.png")
dev.off()