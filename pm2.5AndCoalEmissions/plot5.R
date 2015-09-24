# add ggplot
if(!require("ggplot2")){
  install.packages("ggplot2")
}
require(ggplot2)

# read in data sources
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset vehicle data for Baltimore
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]


# set up file to send plot to
png("plot5.png",width=480,height=480,units="px")

# set up plot
g <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
            geom_bar(stat="identity") +
            labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
            labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions, Baltimore, 1999-2008"))

# print that bad boy
print(g)

# turn off screen device
dev.off()