data_all <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data_with_dates <- mutate(all, POSIXDate = strptime(Date, "%d/%m/%Y"))

feb1 <- as.POSIXlt("2007-02-01")
feb2 <- as.POSIXlt("2007-02-02")
data_feb1and2 <- filter(data_with_dates, POSIXDate == feb1 | POSIXDate == feb2)

png(file = "plot1.png", bg = "transparent")
hist(as.numeric(data_feb1and2$Global_active_power),
     breaks = c(0,0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 6, 6.5, 7, 7.5),
     freq = TRUE,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()
