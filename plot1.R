## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## PED <- readRDS("summarySCC_PM25.rds")

## We first need to sum up all Emission-values for each year.
emissions_year <- aggregate(Emissions ~ year, PED, sum)

png('plot1.png')
## The emission per year value is divided by 100,000 to be easier to read
barplot(	height=emissions_year$Emissions/100000, 
					names.arg=emissions_year$year, 
					xlab="years", 
					ylab=expression('total PM2.5 emission in 100,000 tons'),
					main=expression('Total PM2.5 emissions for years'))
dev.off()
