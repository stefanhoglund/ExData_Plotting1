
data <- read.table("household_power_consumption.txt", header=1, sep=";", colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
data_subset <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")
png(file="plot1.png", width=480, height=480)
hist(data_subset$Global_active_power, col="RED", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#dev.copy(png,"plot1.png")
dev.off()
