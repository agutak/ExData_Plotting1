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

data <- data %>%
  mutate(Date = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")) %>%
  select(Date, Global_active_power)

png("plot2.png")

plot(data$Date,
     data$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     lty = 1,
     type = "l")

dev.off()