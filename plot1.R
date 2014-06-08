# Read in the Electric power consumption data
power <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)

# Subset the data to the dates 2007-02-01 and 2007-02-02
power <- power[power$Date %in% c('1/2/2007', '2/2/2007'), ]

# Convert the Date and Time variables to a Date.Time POSIXlt class variable
power$Time <- paste(power$Date, power$Time, sep = ' ')
power$Time <- strptime(power$Time, format = '%d/%m/%Y %H:%M:%S')
power <- power[, 2:dim(power)[2]]
colnames(power)[1] <- 'Date.Time'

# Plot a histogram of Global active power
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
png('plot1.png', width = 480, height = 480)
hist(power$Global_active_power, col = 'red', ann = FALSE)
title(main = 'Global Active Power', 
      xlab = 'Global Active Power (kilowatts)', 
      ylab = 'Frequency')
dev.off()
