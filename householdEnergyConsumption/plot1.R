# creates plot 1 
# frequency of Global Active Power in kilowatts

# read file
data <- read.table("household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")

# clean up dates and select only the range wanted
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

# create plot 1
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()