# data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
#data_subset1<-data[data$Date == "1/2/2007",]
#data_subset2<-data[data$Date == "2/2/2007",]
#dset = rbind(data_subset1, data_subset2)
#data <- read.table("household_power_consumption.txt", header=1, sep=";", colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
data_subset <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")

x<-as.Date(data_subset$Date,"%d/%m/%Y")
y<-as.numeric(data_subset$Global_active_power)
#png(file="plot2.png", width=480, height=480)
plot(x,y,type="l",ylab="Global Active Power (kilowatts)")
#dev.copy(png,"plot2.png")
dev.off()