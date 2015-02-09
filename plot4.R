require(sqldf)
file <- c("household_power_consumption.txt")
data <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
data <- na.omit(data)
dtm <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
png('plot4.png',width = 480, height = 480, units = "px",bg='transparent')

par(mfrow = c(2,2))

plot(dtm,data$Global_active_power,type='l',col = 'black',xlab='',ylab='Global Active Power')

plot(dtm,data$Voltage,type='l',col = 'black',xlab='datetime',ylab='Voltage')

plot(dtm,data$Sub_metering_1,type='l',col = 'black',xlab='',ylab='Energy Sub Metering')
lines(dtm,data$Sub_metering_2,type='l',col = 'red')
lines(dtm,data$Sub_metering_3,type='l',col = 'blue')
legend("topright",lty=1,lwd = 3, cex = 0.9, bty = 'n', col=c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

plot(dtm,data$Global_reactive_power,type='l',col = 'black',xlab='datetime',ylab='Global Reactive Power')

dev.off()
