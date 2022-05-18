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

plot(house_power$Global_active_power ~ house_power$date_and_time, type="l",
     ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.copy(png, file = 'plot2.png', height = 480, width = 480)
dev.off()