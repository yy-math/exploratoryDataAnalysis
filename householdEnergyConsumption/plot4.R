# creates plot 4
# creates 4 seperate quadrants:
## 1 Global Active Power by day of the week
## 2 Voltage by day of the week
## 3 Energy Sub Metering by day of the week
## 4 Global Reactive Power 

# read file
data <- read.table("household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")

# clean up dates and select only the range wanted
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

# create plot 4
png("plot4.png", width=480, height=480)

# sets up space for 4 quadrants
par(mfrow=c(2,2))

# creates quadrant 1 
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"), Global_active_power,type='l',xlab="", ylab = 'Global Active Power (kilowatts)'))

# creates quadrant 2 
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Voltage, type='l',xlab='datetime', ylab='Voltage'))

# creates quadrant 3
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,type='l',xlab="",ylab = 'Energy sub metering'))
with(data,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_2,col='red'))
with(data,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_3,col='blue'))
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)

# creates quadrant 4
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"), Global_reactive_power,type='l',xlab='datetime'))

dev.off()