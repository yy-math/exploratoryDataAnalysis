# read in data sources
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# aggregate emmissions data by year
aggData <- aggregate(Emissions ~ year,NEI, sum)

# set up file to send plot to
png("plot1.png",width=480,height=480,units="px")

# set up plot
barplot(
  (aggData$Emissions)/10^6,
  names.arg=aggData$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="All PM2.5 Emissions By Year"
)

# turn off screen device
dev.off()