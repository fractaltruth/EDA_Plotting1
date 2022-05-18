## We will first read the file
## However, as there are many rows, we will filter first as per our requirement beforehand
## We need data only from dates 2007-02-01 to 2007-02-02

power <- read.csv('household_power_consumption.txt', header = TRUE, na.strings = '?', sep = ';')
house_power <- power[(power$Date == '1/2/2007' | power$Date == '2/2/2007'), ]

## Now let's check what the data looks like and what its dimensions are
head(house_power)
dim(house_power)

## Now that the dates are filtered, we can now go ahead with plot2
##Since the X-axis has days of the week, we need to do some date formatting

house_power$Date <- as.Date(house_power$Date, format = '%d/%m/%Y')
date_and_time <- paste(house_power$Date, house_power$Time)
house_power$date_and_time <- as.POSIXct(date_and_time)

## Plotting

with(house_power, {
        plot(Sub_metering_1 ~ date_and_time, type = "l",
             ylab = 'Energy sub metering', xlab = '', cex=0.8)
        lines(Sub_metering_2 ~ date_and_time, col = 'red')
        lines(Sub_metering_3 ~ date_and_time, col = 'blue')
})

legend('topright', col = c('black', 'red', 'blue'), lty = 1, lwd = 1, 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), cex=0.8)

dev.copy(png, file = 'plot3.png', height = 480, width = 480)
dev.off()