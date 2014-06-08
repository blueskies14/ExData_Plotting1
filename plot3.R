# Read in the Electric power consumption data
power <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)

# Subset the data to the dates 2007-02-01 and 2007-02-02
power <- power[power$Date %in% c('1/2/2007', '2/2/2007'), ]

# Convert the Date and Time variables to a Date.Time POSIXlt class variable
power$Time <- paste(power$Date, power$Time, sep = ' ')
power$Time <- strptime(power$Time, format = '%d/%m/%Y %H:%M:%S')
power <- power[, 2:dim(power)[2]]
colnames(power)[1] <- 'Date.Time'

# Plot the Energy sub metering as a function of date
power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))

png('plot3.png', width = 480, height = 480)
plot(power$Date.Time, power$Sub_metering_1, type = 'l', ann = FALSE)
lines(power$Date.Time, power$Sub_metering_2, type = 'l', col = 'red')
lines(power$Date.Time, power$Sub_metering_3, type = 'l', col = 'blue')
title(ylab = 'Energy sub metering')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), lty = c(1, 1, 1))
dev.off()
