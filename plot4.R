data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
data_subset1<-data[data$Date == "1/2/2007",]
data_subset2<-data[data$Date == "2/2/2007",]
dset = rbind(data_subset1, data_subset2)
x<-as.numeric(dset$Global_active_power)
hist(x/1000, col="RED")
dev.copy(png,"plot4.png")
dev.off()