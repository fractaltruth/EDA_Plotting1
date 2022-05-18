## We will first read the file
## However, as there are many rows, we will filter first as per our requirement beforehand
## We need data only from dates 2007-02-01 to 2007-02-02

power <- read.csv('household_power_consumption.txt', header = TRUE, na.strings = '?', sep = ';')
house_power <- power[(power$Date == '1/2/2007' | power$Date == '2/2/2007'), ]

## Now let's check what the data looks like and what its dimensions are
head(house_power)
dim(house_power)

## Now that the dates are filtered, we can now go ahead with plot1

hist(house_power$Global_active_power, main = 'Global Active Power', col = 'red', xlab = 'Global Active Power (kilowatts)',
              ylab = 'Frequency')

## We will now export the plot as a png file

dev.copy(png, file = 'plot1.png', height = 480, width = 480)
dev.off()
