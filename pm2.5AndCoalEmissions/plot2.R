# read in data sources
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset to get only Baltimore data
baltimore <- NEI[NEI$fips=="24510",]

# aggregate baltimore data by year
aggBaltimore <- aggregate(Emissions ~ year, baltimore,sum)

# set up file to send plot to
png("plot2.png",width=480,height=480,units="px")

# set up plot
barplot(
  aggBaltimore$Emissions,
  names.arg=aggBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Baltimore PM2.5 Emissions By Year"
)

# turn off screen device
dev.off()