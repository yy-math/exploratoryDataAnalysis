# add ggplot
if(!require("ggplot2")){
  install.packages("ggplot2")
}
require(ggplot2)

# read in data sources
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset vehicles data for baltimore and LA, and combine
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]
vehiclesBaltimoreNEI$city <- "Baltimore City"
vehiclesLosAngelesNEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLosAngelesNEI$city <- "Los Angeles County"
comboNEI <- rbind(vehiclesBaltimoreNEI,vehiclesLosAngelesNEI)

# set up file to send plot to
png("plot6.png",width=480,height=480,units="px")

# set up plot
g <- ggplot(comboNEI, aes(x=factor(year), y=Emissions, fill=city)) +
              geom_bar(aes(fill=year),stat="identity") +
              facet_grid(.~city) +
              guides(fill=FALSE) +
              labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
              labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions, Baltimore Los Angeles, 1999-2008"))

# print that bad boy
print(g)

# turn off screen device
dev.off()