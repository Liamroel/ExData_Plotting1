txtfile<-"household_power_consumption.txt" 
#Reading text file
data<-read.table(txtfile, header=TRUE, sep=";",stringsAsFactors = FALSE, dec=".") 
#Selecting Data from 1/2/2007 to 2/2/2007
slcdata<-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
#Transform the data into "Date Format"
Onedata<-as.Date(slcdata$Date,"%d/%m/%Y")
slcdata<-cbind(slcdata, "DateTime"=as.POSIXct(paste(Onedata,slcdata$Time)))
#Code for plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(slcdata$Global_active_power ~ slcdata$DateTime, type="l")
plot(slcdata$Voltage ~ slcdata$DateTime, type="l")

with(slcdata, {plot(Sub_metering_1 ~ DateTime, type="l")})
lines(slcdata$Sub_metering_2 ~ slcdata$DateTime, col = 'Red')
lines(slcdata$Sub_metering_3 ~ slcdata$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(slcdata$Global_reactive_power ~ slcdata$DateTime, type="l")
dev.off()