library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
LAmore <- filter(NEI, NEI$fips %in% c("24510","06037")  & NEI$type == "ON-ROAD")
LAmoreTotal <-  aggregate(Emissions ~ year + fips, LAmore, sum)
png(filename = "plot6.png", width = 480, height = 480)
ggplot(LAmoreTotal, aes(year, Emissions, col = fips)) +
        geom_line() +
        geom_point() +
        ggtitle(expression("Baltimore and Los Angeles" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
        labs(x = "Year", y = expression(~PM[2.5]~ "Motor Vehicle Emissions") ) +
        scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
        theme(legend.title = element_text(face = "bold"))
dev.off()