## Plot No_3

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make
# a plot answer this question.

library(ggplot2)

## Loading data
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}


subNEI  <- NEI[NEI$fips=="24510", ]

totalByYearAndType <- aggregate(Emissions ~ year + type, subNEI, sum)
##

png('plot3.png', width=800, height=500)

ggplot(totalByYearAndType, aes(year, Emissions, color = type))+ geom_line()+ 
  ylab('Emissions per type') + xlab('Year') + 
  ggtitle('Emissions PM2.5 in Baltimore City (1999-2008)')

dev.off()
