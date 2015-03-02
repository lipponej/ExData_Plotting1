library(sqldf)

createPng2 <- function() {
    data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
    png(filename = "plot2.png" , width = 480, height = 480)
    plot(y = data$Global_active_power,  x = as.POSIXct( paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), type="l", xlab = "", ylab ="Global Active Power (kilowatts)")
    dev.off()
}

createPng2()