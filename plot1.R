library(sqldf)

createPng1 <- function() {
    data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
    png(filename = "plot1.png" , width = 480, height = 480)
    hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    dev.off()
    rm(data)
    closeAllConnections()
}

createPng1()