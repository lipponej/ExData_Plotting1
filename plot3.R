library(sqldf)

createPng3 <- function() {
    data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
    png(filename = "plot3.png" , width = 480, height = 480)
    with(data, plot(Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
    points(data$Sub_metering_2, type="l", col="red")
    points(data$Sub_metering_3, type="l", col="blue")
    legend("topright", pch="_", col=c("black", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
}

createPng3()
