plot1 <- function(){
#   NEI <- readRDS("summarySCC_PM25.rds")
#   SCC <- readRDS("Source_Classification_Code.rds")
  emissions <- aggregate(Emissions ~ year, data = NEI, sum)
  plot(emissions, type = "l", xaxt = "n")
  axis(1, at = c(1999,2002, 2005, 2008))
}