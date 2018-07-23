txtfile<-"household_power_consumption.txt" 
#Reading text file
data<-read.table(txtfile, header=TRUE, sep=";",stringsAsFactors = FALSE, dec=".") 
#Selecting Data from 1/2/2007 to 2/2/2007
slcdata<-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
#Transform the data into "Date Format"
Onedata<-as.Date(slcdata$Date,"%d/%m/%Y")
slcdata<-cbind(slcdata, "DateTime"=as.POSIXct(paste(Onedata,slcdata$Time)))
#Code for plot 1
hist(as.numeric(slcdata$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
