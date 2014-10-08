## This script requires the package sqldf 
## if not installed, first do so:
## install.packages("sqldf")
## library(sqldf)

dat <- read.csv.sql("household_power_consumption.txt", 
                    sql = "SELECT * from file WHERE Date in ('1/2/2007', '2/2/2007')  ", sep = ";", header = TRUE)

dat$date_time <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot4.png", width=480, height=480)

par(mfrow=c(2,2))


plot(dat$date_time, dat$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

plot(dat$date_time, dat$Voltage, type="l", xlab="datetime",
     ylab="Voltage")


plot(dat$date_time, dat$Sub_metering_1, type="n", xlab="",
     ylab="Energy sub metering")
lines(dat$date_time, dat$Sub_metering_1)
lines(dat$date_time, dat$Sub_metering_2, col="Red")
lines(dat$date_time, dat$Sub_metering_3, col="Blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), 
       col=c("Black", "Red", "Blue"))


plot(dat$date_time, dat$Global_reactive_power,
     type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()
