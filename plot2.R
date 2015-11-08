# Load Data
file <- "../household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02
data <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]

# convert the Date and Time variables to Date/Time classes in R using the strptime() functions.
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# set english locale to get weekdays in english
Sys.setlocale("LC_ALL", "en_US")

# Construct the plot and save it to a PNG file
plot(data$Date,data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()