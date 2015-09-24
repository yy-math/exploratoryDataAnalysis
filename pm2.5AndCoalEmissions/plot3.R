# add ggplot
if(!require("ggplot2")){
  install.packages("ggplot2")
}
require(ggplot2)

# read in data sources
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset to get only Baltimore data
baltimore <- NEI[NEI$fips=="24510",]

# aggregate baltimore data by year
aggBaltimore <- aggregate(Emissions ~ year, baltimore,sum)

# set up file to send plot to
png("plot3.png",width=480,height=480,units="px")

# set up plot
g <- ggplot(baltimore,aes(factor(year),Emissions,fill=type)) +
            geom_bar(stat="identity") +
            theme_bw() + guides(fill=FALSE)+
            facet_grid(.~type,scales = "free",space="free") + 
            labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
            labs(title=expression("PM"[2.5]*" Emissions by Source Type, Baltimore, 1999-2008"))

# print that bad boy
print(g)

# turn off screen device
dev.off()