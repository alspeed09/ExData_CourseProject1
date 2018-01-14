##Read data

HPCnames <- read.delim("household_power_consumption.txt", sep = ";", nrows = 2)
HPC <- read.delim("household_power_consumption.txt", sep = ";", nrows = 2880, na.strings = "?",
                  skip = 66636, header = T, stringsAsFactors = F)
names(HPC) <- names(HPCnames)

##Change to date and time

HPC$Dates <- strptime(paste(HPC$Date, HPC$Time), format = "%d/%m/%Y %H:%M:%S")
HPC$Dates <- as.POSIXct(HPC$Dates, locale = "english")


#Plot 3
png("plot3.png", width = 480, height = 480)
plot(Sub_metering_1 ~ Dates, type = "l", data = HPC, 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ Dates, type = "l", data = HPC, col = "Red")
lines(Sub_metering_3 ~ Dates, type = "l", data = HPC, col = "Blue")
legend("topright", legend = names(HPC)[7:9], col = c("Black", "Red", "Blue"),
       lwd = 1)
dev.off()