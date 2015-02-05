
# Read in source date
data <- read.table("household_power_consumption.txt", header=1, sep=";", colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

# Select data for 2/2/2007 and 1/2/2007
data_subset <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")

# Combine Date and Time columns and convert to POSIXct for use as X
x<-as.POSIXct(paste(data_subset$Date,data_subset$Time),format="%d/%m/%Y %H:%M:%S")

# Select Global_active_power to use as Y
y<-as.numeric(data_subset$Global_active_power)

# Open a png plotting device
png(file="plot2.png", width=480, height=480)

# Create the line plot and name the axis
plot(x,y,type="l",ylab="Global Active Power (kilowatts)",xlab="")

# Close the png plotting device
dev.off()