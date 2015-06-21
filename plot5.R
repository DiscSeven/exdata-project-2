## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

PED <- readRDS("summarySCC_PM25.rds")

PED_on_road <- PED[PED$fips=="24510" & PED$type=="ON-ROAD",]

## We then need to sum up all Emission-values for each year.
on_road_year <- aggregate(Emissions ~ year, PED_on_road, sum)

png('plot5.png')
barplot(	height=on_road_year$Emissions, 
					names.arg=on_road_year$year, 
					xlab="years", 
					ylab=expression('PM2.5 emission in tons'),
					main=expression('Total PM2.5 emissions from motor vehicle sources 1999-2008'))
dev.off()
