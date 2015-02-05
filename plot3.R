
# Read in source date
data <- read.table("household_power_consumption.txt", header=1, sep=";", colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

# Select data for 2/2/2007 and 1/2/2007
data_subset <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")

# Combine Date and Time columns and convert to POSIXct for use as X
x<-as.POSIXct(paste(data_subset$Date,data_subset$Time),format="%d/%m/%Y %H:%M:%S")

# Open a png plotting device
png(file="plot3.png", width=480, height=480)

# Create the line plot and name the axis
plot(x,data_subset$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x,data_subset$Sub_metering_2,type="l",col="Red")
lines(x,data_subset$Sub_metering_3,type="l",col="Blue")

# Add legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lty=1)

# Close the png plotting device
dev.off()