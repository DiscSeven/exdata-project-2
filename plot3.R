## Of the four types of sources indicated by the type (point, nonpoint, onroad, 
## nonroad) variable, which of these four sources have seen decreases in emissions
## from 1999–2008 for Baltimore City? Which have seen increases in emissions from
## 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

PED <- readRDS("summarySCC_PM25.rds")

## We first subset the Baltimore City, Maryland (fips == "24510") values.
PED_BCM  <- PED[PED$fips=="24510",]

## We then need to sum up all Emission-values for each year.
emissions_year_type <- aggregate(Emissions ~ year + type, PED_BCM, sum)

png('plot3.png', width=640, height=480)
g <- ggplot(emissions_year_type, aes(year, Emissions, color = type))
## Each addition adds a part of the plot
g <-	g + geom_line() +
			xlab("year") +
			ylab(expression("Total PM Emissions")) +
			ggtitle("Total Emissions in Baltimore City, Maryland for years")
print(g)
dev.off()
