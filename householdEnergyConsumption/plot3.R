# creates plot 3
# Energy Sub Metering by day of the week

# read file
data <- read.table("household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")

# clean up dates and select only the range wanted
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

# create plot 3
png("plot3.png", width=480, height=480)

# plots series 1 
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,type='l',xlab="",ylab = 'Energy sub metering'))

# plots series 2
with(data,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_2,col='red'))

# plots series 3
with(data,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_3,col='blue'))

# adds legend
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)

dev.off()
