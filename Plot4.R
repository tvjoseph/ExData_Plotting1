## Read the data into a variable called housedat
housedat <- read.table("household_power_consumption.txt",header = T, sep = ";",na.string = "?")
## Rename the columns of housedat
names(housedat) <- c("date","time","active","Reactive","voltage","intensity","SM1","SM2","SM3")
## Coerse the dates in the proper format
housedat$date <- as.Date(housedat$date,format = "%d/%m/%Y")
## Filter the data as per the dates
seldata <- housedat[housedat$date >= "2007-02-01" & housedat$date <= "2007-02-02",]
## convert the dates into week days
seldata$date <- weekdays(as.Date(seldata$date,"%d/%m/%Y"))

## Plot the data

par(mfrow = c(2,2))
with(seldata,plot(time,active,ylab = "Global Active Power"))
with(seldata,plot(time,voltage, ylab = "Voltage"))
with(seldata,plot(time,SM1,ylab = "Energy Sub Metering"))
with(seldata, plot(time,Reactive,ylab = "Global_Reactive_Power"))
dev.copy(png,file = "plot4.png")
dev.off()