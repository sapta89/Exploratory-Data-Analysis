require(sqldf)
file <- c("household_power_consumption.txt")
data <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
data <- na.omit(data)
dtm <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
png('plot2.png',width = 480, height = 480, units = "px",bg='transparent')
plot(dtm,data$Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.off()
