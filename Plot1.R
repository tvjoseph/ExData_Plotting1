housedat <- read.table("household_power_consumption.txt",header = T, sep = ";",na.string = "?")
names(housedat) <- c("date","time","active","Reactive","voltage","intensity","SM1","SM2","SM3")
housedat$date <- as.Date(housedat$date,format = "%d/%m/%Y")
seldata <- housedat[housedat$date >= "2007-02-01" & housedat$date <= "2007-02-02",]

hist(seldata$active,col = "red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)", ylab = "Frequency")
dev.copy(png,file = "plot1.png")
dev.off()