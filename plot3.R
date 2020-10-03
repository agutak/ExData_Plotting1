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
  select(Date, Sub_metering_1 : Sub_metering_3)

png("plot3.png")

par("lty" = 1)

plot(data$Date,
     data$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type = "l",
     col = "black")

lines(data$Date,
      data$Sub_metering_2,
      type = "l",
      col = "red")

lines(data$Date,
      data$Sub_metering_3,
      type = "l",
      col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1,1,1))

dev.off()