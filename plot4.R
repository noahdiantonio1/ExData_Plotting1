if(!file.exists("HPC.zip")) {
        file.create("HPC.zip")
}
zipurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(zipurl, "HPC.zip")
currentwd <- getwd()
unzip("HPC.zip", exdir = currentwd)
HPCdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
HPCdata <- subset(HPCdata, HPCdata$Date == "1/2/2007" | HPCdata$Date == "2/2/2007")

datetime <- strptime(paste(HPCdata$Date, HPCdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, as.numeric(HPCdata$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power")
plot(datetime, as.numeric(HPCdata$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")
plot(datetime, as.numeric(HPCdata$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, as.numeric(HPCdata$Sub_metering_2), col = "red")
lines(datetime, as.numeric(HPCdata$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"), bty = "n")
plot(datetime, as.numeric(HPCdata$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()