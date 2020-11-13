library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SC <- readRDS("Source_Classification_Code.rds")
SCcoal <- SC[grepl("coal", SC$Short.Name, ignore.case = T),]
NEIcoal <- NEI[NEI$SCC %in% SCcoal$SCC,]
totalCoal <- aggregate(Emissions ~ year + type, NEIcoal, sum)
png(filename = "plot4.png", width = 480, height = 480)
ggplot(totalCoal, aes(year, Emissions, col = type)) +
        geom_line() +
        geom_point() +
        ggtitle(expression("Total US" ~ PM[2.5] ~ "Coal Emission by Type and Year")) +
        xlab("Year") +
        ylab(expression("US " ~ PM[2.5] ~ "Coal Emission")) +
        scale_colour_discrete(name = "Type of sources") +
        theme(legend.title = element_text(face = "bold"))
dev.off()
