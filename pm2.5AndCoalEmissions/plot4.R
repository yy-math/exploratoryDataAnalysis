# add ggplot
if(!require("ggplot2")){
  install.packages("ggplot2")
}
require(ggplot2)

# read in data sources
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset coal combustion data
comb <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
combcoal <- (comb & coal)
combcoalSCC <- SCC[combcoal,]$SCC
combcoalNEI <- NEI[NEI$SCC %in% combcoalSCC,]

# set up file to send plot to
png("plot4.png",width=480,height=480,units="px")

# set up plot
g <- ggplot(combcoalNEI,aes(factor(year),Emissions/10^5)) +
            geom_bar(stat="identity") +
            labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
            labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions, US, 1999-2008"))

# print that bad boy
print(g)

# turn off screen device
dev.off()