## Plot No_4
library(ggplot2)
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## Loading data
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}


coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]
joinNEISCC <- merge(NEI, coal, by = "SCC")
totalByYear <- aggregate(joinNEISCC[,4]/1000,list(joinNEISCC[,6]), sum)
colnames(totalByYear) <- c("year", "Emissions")

##

png('plot4.png', width=800, height=500)

ggplot(totalByYear, aes(factor(year), Emissions)) + 
  geom_bar(stat="identity") +
  ggtitle('Total emissions from coal (1999–2008)') + 
  xlab('Year') +
  ylab('Emission PM2.5 in Kilotons') + 
  geom_text(aes(label=round(Emissions,digits=2), size=2, hjust=1.5, vjust=1.5))

dev.off()

