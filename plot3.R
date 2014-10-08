## This script requires the package sqldf 
## if not installed, first do so:
## install.packages("sqldf")
## library(sqldf)

dat <- read.csv.sql("household_power_consumption.txt", 
                    sql = "SELECT * from file WHERE Date in ('1/2/2007', '2/2/2007')  ", sep = ";", header = TRUE)

dat$date_time <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
png(file="plot3.png", width=480, height=480)
plot(dat$date_time, dat$Sub_metering_1, type="n", xlab="",
     ylab="Energy sub metering")
lines(dat$date_time, dat$Sub_metering_1)
lines(dat$date_time, dat$Sub_metering_2, col="Red")
lines(dat$date_time, dat$Sub_metering_3, col="Blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), 
       col=c("Black", "Red", "Blue"))
dev.off()
