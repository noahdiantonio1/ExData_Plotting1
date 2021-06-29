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
png("plot2.png", width=480, height=480)
plot(datetime, as.numeric(HPCdata$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()