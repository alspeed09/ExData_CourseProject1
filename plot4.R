##Read data

HPCnames <- read.delim("household_power_consumption.txt", sep = ";", nrows = 2)
HPC <- read.delim("household_power_consumption.txt", sep = ";", nrows = 2880, na.strings = "?",
                  skip = 66636, header = T, stringsAsFactors = F)
names(HPC) <- names(HPCnames)

##Change to date and time

HPC$Dates <- strptime(paste(HPC$Date, HPC$Time), format = "%d/%m/%Y %H:%M:%S")
HPC$Dates <- as.POSIXct(HPC$Dates, locale = "english")

#Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

#Add plot 2
plot(Global_active_power ~ Dates, type = "l", data = HPC,
     ylab = "Global Active Power (kilowatts)", xlab = "")
#Add voltage plot
plot(Voltage ~ Dates, type = "l", data = HPC, xlab = "datetime")
#Add plot 3
plot(Sub_metering_1 ~ Dates, type = "l", data = HPC, 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ Dates, type = "l", data = HPC, col = "Red")
lines(Sub_metering_3 ~ Dates, type = "l", data = HPC, col = "Blue")
legend("topright", legend = names(HPC)[7:9], col = c("Black", "Red", "Blue"),
       lwd = 1, bty = "n")
#Add reactive power plot
plot(Global_reactive_power ~ Dates, type = "l", data = HPC, xlab = "datetime")
dev.off()