plot1 <- function(){
#   NEI <- readRDS("summarySCC_PM25.rds")
#   SCC <- readRDS("Source_Classification_Code.rds")
  sum1999  <- sum(NEI$Emissions, NEI$year == 1999)
  sum2002  <- sum(NEI$Emissions, NEI$year == 2002)
  sum2005  <- sum(NEI$Emissions, NEI$year == 2005)
  sum2008  <- sum(NEI$Emissions, NEI$year == 2008)
  emission <- c(sum1999, sum2002, sum2005, sum2008)
  years  <- c(1999,2002,2005,2008)
  plot(years,emission, type = "l", xaxt = "n")
  axis(1, at = c(1999,2002, 2005, 2008))
}