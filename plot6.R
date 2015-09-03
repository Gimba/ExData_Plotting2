plot6 <- function(){
  #   NEI <- readRDS("summarySCC_PM25.rds")
  #   SCC <- readRDS("Source_Classification_Code.rds")
  
  foo <- SCC[grep("mobile", SCC$SCC.Level.One, ignore.case = TRUE), "SCC"]
  bar <- NEI[NEI$fips == "24510" | NEI$fips == "06037",]
  temp  <- bar[bar$SCC %in% foo, c("year","Emissions", "fips")]
  
  emissions <- aggregate(Emissions ~ year + fips, data = temp, sum)
  
  totalBaltimore <- sum(emissions[emissions$fips == 24510, "Emissions"])
  
  totalLA <- sum(emissions[emissions$fips == "06037", "Emissions"])
  
  emissions[emissions$fips == "06037", "Emissions" ] <- emissions[emissions$fips == "06037", "Emissions" ]/totalLA
  
  emissions[emissions$fips == "24510", "Emissions" ] <- emissions[emissions$fips == "24510", "Emissions" ]/totalBaltimore
  
  emissions[emissions$fips == "06037", "fips" ] <- "Los Angeles"
  
  emissions[emissions$fips == "24510", "fips" ] <- "Baltimore"
  
  m <- qplot(year, Emissions, data=emissions, color=fips, geom="path", main="Change of PM2.5 Emission in LA and Baltimore", xlab="Year", ylab="Emissions change", aes(year, Emissions))
  m + scale_x_continuous(breaks=c(1999,2002,2005,2008)) + theme(legend.title=element_blank())
  
}