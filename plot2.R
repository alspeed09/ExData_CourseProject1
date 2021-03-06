##Read data

HPCnames <- read.delim("household_power_consumption.txt", sep = ";", nrows = 2)
HPC <- read.delim("household_power_consumption.txt", sep = ";", nrows = 2880, na.strings = "?",
                  skip = 66636, header = T, stringsAsFactors = F)
names(HPC) <- names(HPCnames)

##Change to date and time

HPC$Dates <- strptime(paste(HPC$Date, HPC$Time), format = "%d/%m/%Y %H:%M:%S")
HPC$Dates <- as.POSIXct(HPC$Dates, locale = "english")

#Plot 2
png("plot2.png", width = 480, height = 480)
plot(Global_active_power ~ Dates, type = "l", data = HPC,
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()