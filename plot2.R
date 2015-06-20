## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## PED <- readRDS("summarySCC_PM25.rds")

## We first subset the Baltimore City, Maryland (fips == "24510") values.
PED_BCM  <- PED[PED$fips=="24510",]

## We first need to sum up all Emission-values for each year.
BCM_emissions_year <- aggregate(Emissions ~ year, PED_BCM, sum)

png('plot2.png')
## The emission per year value is divided by 100 to be easier to read
barplot(	height=BCM_emissions_year$Emissions/100, 
					names.arg=BCM_emissions_year$year, 
					xlab="years", 
					ylab=expression('total PM2.5 emission in 100 tons'),
					main=expression('Total PM2.5 emissions in Baltimore City, Maryland for years'))
dev.off()
