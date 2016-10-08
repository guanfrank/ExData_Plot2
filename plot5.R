## Plot No_5
library(ggplot2)
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Loading data
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

subNEI <- subset(NEI, (NEI[,1]=="24510" & NEI[,5]=="ON-ROAD" ))
subNEI$year <- factor(subNEI$year, levels=c('1999', '2002', '2005', '2008'))
mv <- aggregate(subNEI[,4],list(subNEI[,6]), sum)
colnames(mv) <- c("year", "Emissions")

##

png('plot5.png', width=800, height=500)

ggplot(mv, aes(year, Emissions)) +
  geom_bar(aes(fill=year),stat = "identity") + 
  ggtitle('Total emissions from motor vehicle in Baltimore City (1999-2008)') + 
  xlab('Year') +
  ylab('Emission PM2.5 in Kilotons') + 
  geom_text(aes(label=round(Emissions), size=5, hjust=1, vjust=0))

dev.off()