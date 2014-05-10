# Read the data
data <- read.table("household_power_consumption.txt", sep=';', header=T)

#Extract only the relevant data
data <- subset(data, Date %in% c('1/2/2007', '2/2/2007'))

#Change the format of the data
data$Datetime <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
data$Global_active_power <- as.numeric(data$Global_active_power)

#plot
png('plot2.png')
with(data, plot(Datetime, Global_active_power/1000*2, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = ''))
dev.off()