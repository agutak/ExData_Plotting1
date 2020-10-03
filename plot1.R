library("dplyr")

unzip("exdata_data_household_power_consumption.zip", overwrite = TRUE)

fileName <- "household_power_consumption.txt"

headers <- read.csv(
  fileName,
  sep = ";",
  header = FALSE,
  nrows = 1)

data <- read.csv(
  fileName,
  sep = ";",
  header = FALSE,
  na.strings = c("?"),
  skip = 66637,
  nrows = 2880,
  col.names = headers)

png("plot1.png")

hist(
  data$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency")

dev.off()