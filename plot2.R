## This script requires the package sqldf 
## if not installed, first do so:
## install.packages("sqldf")
## library(sqldf)

dat <- read.csv.sql("household_power_consumption.txt", 
sql = "SELECT * from file WHERE Date in ('1/2/2007', '2/2/2007')  ", sep = ";", header = TRUE)

dat$date_time <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
png(file="plot2.png", width=480, height=480)
plot(dat$date_time, dat$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()