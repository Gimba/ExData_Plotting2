plot5 <- function(){
  #   NEI <- readRDS("summarySCC_PM25.rds")
  #   SCC <- readRDS("Source_Classification_Code.rds")
  
  foo <- SCC[grep("mobile", SCC$SCC.Level.One, ignore.case = TRUE), "SCC"]
  bar <- NEI[NEI$fips == "24510",]
  temp  <- bar[bar$SCC %in% foo, c("year","Emissions")]
  
  emissions <- aggregate(Emissions ~ year, data = temp, sum)
  
  plot(emissions, type = "l", xaxt = "n")
  axis(1, at = c(1999,2002, 2005, 2008))
}