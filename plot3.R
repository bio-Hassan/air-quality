library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
BaltimoreData <- filter(NEI, fips == "24510")
BaltimoreType <- aggregate(Emissions ~ year + type, BaltimoreData, sum)
png(filename = "plot3.png", width = 480, height = 480)
ggplot(BaltimoreType, aes(year, Emissions, col = type)) +
        geom_line() +
        geom_point() +
        ggtitle(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions by Type and Year")) +
        ylab(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions")) +
        xlab("Year") +
        scale_colour_discrete(name = "Type of sources") +
        theme(legend.title = element_text(face = "bold"))
dev.off()
