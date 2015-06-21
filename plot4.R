## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

PED <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Merge data into one.
PED_SCC <- merge(PED, SCC, by="SCC")

## All rows with the word coal on them
coal  <- grepl("coal", PED_SCC$Short.Name, ignore.case=TRUE)
## Subset of those rows
PED_SCC_coal <- PED_SCC[coal,]

## We then need to sum up all Emission-values for each year.
coal_year <- aggregate(Emissions ~ year, PED_SCC_coal, sum)

png('plot4.png')
barplot(	height=coal_year$Emissions, 
					names.arg=coal_year$year, 
					xlab="years", 
					ylab=expression('PM2.5 emission in tons'),
					main=expression('Total coal combustion-related PM2.5 emissions for years'))
dev.off()
