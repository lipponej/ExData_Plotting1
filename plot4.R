library(sqldf)

createPng4 <- function() {
    data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
    png(filename = "plot4.png" , width = 480, height = 480)
    par(mfrow = c(2,2))
    plot11(timeLine)
    plot12(timeLine)
    plot13(timeLine)
    plot14(timeLine)
    dev.off()
}

plot11 <- function(timeLine) {
    plot(y = data$Global_active_power,  x = as.POSIXct( paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), type="l", xlab = "", ylab ="Global Active Power")
}

plot12 <- function(timeLine) {
    plot(y = data$Voltage,  x = as.POSIXct( paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), type="l", ylab ="Voltage", xlab="datetime")
}

plot13 <- function(timeLine) {
    with(data, plot(y=Sub_metering_1, type="l", x = as.POSIXct( paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), xlab="", ylab="Energy sub metering"))
    points(y=data$Sub_metering_2, x = as.POSIXct( paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), type="l", col="red")
    points(y=data$Sub_metering_3, x = as.POSIXct( paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), type="l", col="blue")
    legend("topright", pch="_", col=c("black", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
}

plot14 <- function(timeLine) {
    plot(y = data$Global_reactive_power,  x = as.POSIXct( paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), type="l", ylab ="Global_reactive_power", xlab="datetime")
}

createPng4()
