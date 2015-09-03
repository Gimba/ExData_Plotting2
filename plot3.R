plot3 <- function(){
  library(ggplot2)
  #   NEI <- readRDS("summarySCC_PM25.rds")
  #   SCC <- readRDS("Source_Classification_Code.rds")

  emissions <- aggregate(Emissions ~ year + type, data = subset(NEI, fips == "24510"), sum)
  
  m <- qplot(year, Emissions, data=emissions, color=type, geom="path", main="Baltimore PM2.5 Emission by Type", xlab="Year", ylab="Emissions", aes(year, Emissions))
  m + scale_x_continuous(breaks=c(1999,2002,2005,2008))
}