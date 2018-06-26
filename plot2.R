library(lubridate)
hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
hpc_shorty <- hpc[dmy(hpc$Date) == "2007-02-01" | dmy(hpc$Date) == "2007-02-02",]

hpc_shorty$date_time <- dmy_hms(paste(hpc_shorty$Date, hpc_shorty$Time, sep = " "))

plot(hpc_shorty$date_time, 
     hpc_shorty$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()