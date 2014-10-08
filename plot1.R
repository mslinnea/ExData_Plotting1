## This script requires the package sqldf 
## if not installed, first do so:
## install.packages("sqldf")
## library(sqldf)

## This creates a Histogram of "Global Active Power" and saves it as a png file.

dat <- read.csv.sql("household_power_consumption.txt", 
sql = "SELECT * from file WHERE Date in ('1/2/2007', '2/2/2007')  ", sep = ";", header = TRUE)
png(file="plot1.png", width=480, height=480)
hist(dat$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()