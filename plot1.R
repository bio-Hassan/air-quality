library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SC <- readRDS("Source_Classification_Code.rds")
groubNEI <- group_by(NEI, year)
totalNEI <- summarise(groubNEI, sum(Emissions, na.rm = T))
png(filename = "plot1.png", width = 480, height = 480)
plot(totalNEI$year, totalNEI$`sum(Emissions, na.rm = T)` , type = "o", col = "steelblue3", main = expression("Total US "~ PM[2.5]~ "Emissions by Year"), ylab = expression("Total US "~   PM[2.5] ~ "Emissions"), xlab = "Year")
dev.off()
