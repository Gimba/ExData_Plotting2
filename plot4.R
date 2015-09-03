plot4 <- function(){
  #   NEI <- readRDS("summarySCC_PM25.rds")
  #   SCC <- readRDS("Source_Classification_Code.rds")
  temp <- SCC[grep("coal", SCC$EI.Sector, ignore.case = TRUE), "SCC"]
  temp  <- NEI[NEI$SCC %in% temp, c("year","Emissions")]
  
  emissions <- aggregate(Emissions ~ year, data = temp, sum)
  
  plot(emissions, type = "l", xaxt = "n")
  axis(1, at = c(1999,2002, 2005, 2008))
}