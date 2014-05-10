# Read the data
data <- read.table("household_power_consumption.txt", sep=';', header=T)

#Extract only the relevant data
data <- subset(data, Date %in% c('1/2/2007', '2/2/2007'))

#Change the format of the data
data$Datetime <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
data$Global_active_power <- as.numeric(data$Global_active_power)

#plot
png('plot3.png')

with(data, plot(Datetime, Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '', yaxp=c(0, 40, 4)))
with(data, lines(Datetime, Sub_metering_2, col = "red"))
with(data, lines(Datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()