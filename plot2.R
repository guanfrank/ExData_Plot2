## Plot No_2

# Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Loading data

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}


b <- tapply((NEI[NEI$fips=="24510",4])/1000,(NEI[NEI$fips=="24510",6]), sum)

###

png('plot2.png', width=800, height=500)

barplot(b,  main = "Total emissions PM2.5 in Baltimore City (1999-2008)", xlab = 'Years', ylab = 'Emission PM2.5 in Kilotons', col = c("orange", "light blue", "light green", "grey"))

dev.off()