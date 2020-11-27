data_all <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data_with_dates <- mutate(all, POSIXDate = strptime(Date, "%d/%m/%Y"))

feb1 <- as.POSIXlt("2007-02-01")
feb2 <- as.POSIXlt("2007-02-02")
data_feb1and2 <- filter(data_with_dates, POSIXDate == feb1 | POSIXDate == feb2)
data_with_datetime <- mutate(data_feb1and2, POSIXDateTime = strptime(sprintf("%s %s", Date, Time), "%d/%m/%Y %H:%M:%S"))

png(file = "plot3.png", bg = "transparent")
plot(data_with_datetime$POSIXDateTime, as.numeric(data_with_datetime$Sub_metering_1), 
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = "")
lines(data_with_datetime$POSIXDateTime, as.numeric(data_with_datetime$Sub_metering_2), col = "red")
lines(data_with_datetime$POSIXDateTime, as.numeric(data_with_datetime$Sub_metering_3), col = "blue")
legend("topright", lty = c(1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
