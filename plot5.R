library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
BaltimoreMotor <- filter(NEI, fips == "24510" & NEI$type == "ON-ROAD")
BaltimoreMotorTotal <- aggregate(Emissions ~ year, BaltimoreMotor, sum)
png(filename = "plot5.png", width = 480, height = 480)
ggplot(BaltimoreMotorTotal, aes(year, Emissions)) +
        geom_line() +
        geom_point() +
        ggtitle(expression("Baltimore " ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
        xlab("Year") +
        ylab(expression(~PM[2.5]~ "Motor Vehicle Emissions"))
dev.off()