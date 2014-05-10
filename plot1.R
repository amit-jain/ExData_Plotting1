# Read the data
data <- read.table("household_power_consumption.txt", sep=';', header=T)

#Extract only the relevant data
data <- subset(data, Date %in% c('1/2/2007', '2/2/2007'))

#Change the format of the data
data$Datetime <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
data$Global_active_power <- as.numeric(data$Global_active_power)

#plot
png('plot1.png')
hist(data$Global_active_power/1000, xlab = 'Global Active Power (kilowatts)', main='Global Active Power', xlim=c(0,6), ylim=c(0,1200), col=c('Red'), axes=F)
axis(2)
axis(1, at=seq(0,6,by=2), labels=seq(0,6,by=2))
dev.off()