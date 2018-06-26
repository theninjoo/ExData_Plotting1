library(lubridate)

hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

hpc_shorty <- hpc[dmy(hpc$Date) == "2007-02-01" | dmy(hpc$Date) == "2007-02-02",]

hist(as.numeric(as.character(hpc_shorty$Global_active_power)), 
     xlab = "Global Active Power (kilowatts)", 
     col = "red", 
     main = "Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()