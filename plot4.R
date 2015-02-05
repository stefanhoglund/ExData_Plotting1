# Read in source date
data <- read.table("household_power_consumption.txt", header=1, sep=";", colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

# Select data for 2/2/2007 and 1/2/2007
data_subset <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")

# Open a png plotting device
png(file="plot4.png", width=480, height=480)

op<-par(mfcol = c(2,2))

# Combine Date and Time columns and convert to POSIXct for use as X
x<-as.POSIXct(paste(data_subset$Date,data_subset$Time),format="%d/%m/%Y %H:%M:%S")

# Plot 1

plot(x,as.numeric(data_subset$Global_active_power),type="l",ylab="Global Active Power (kilowatts)",xlab="")

# Plot 2

# Create the line plot and name the axis
plot(x,data_subset$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x,data_subset$Sub_metering_2,type="l",col="Red")
lines(x,data_subset$Sub_metering_3,type="l",col="Blue")

# Add legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lty=1,bty="n")

# Plot 3
plot(x,data_subset$Voltage,type="l",ylab="Voltage",xlab="datetime")

# Plot 4
plot(x,data_subset$Global_reactive_power,type="l",ylab="global_reactive_power",xlab="datetime")

par(op)

dev.off()