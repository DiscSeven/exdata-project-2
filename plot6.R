## Compare emissions from motor vehicle sources in Baltimore City with emissions 
## from motor vehicle sources in Los Angeles County, California (fips == "06037").
## Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

PED <- readRDS("summarySCC_PM25.rds")

PED_BCM <- PED[(PED$fips=="24510"|PED$fips=="06037")&PED$type=="ON-ROAD",]

emissions <- aggregate(Emissions ~ year + fips, PED_BCM, sum)
emissions$fips[emissions$fips=="24510"] <- "Baltimore"
emissions$fips[emissions$fips=="06037"] <- "Los Angeles"

png("plot6.png", width=1040, height=480)
g <- ggplot(emissions, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
			xlab("year") +
			ylab(expression('Total Emissions')) +
			ggtitle('Emissions')
print(g)
dev.off()


