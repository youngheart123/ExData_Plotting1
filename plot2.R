## read data
d0 <- read.table("household_power_consumption.txt",header=T,
                 sep=";",nrows=-1,stringsAsFactors=F,na.strings="?")

## date time conversion
d0$Times <- strptime(paste(d0$Date, d0$Time), "%d/%m/%Y %H:%M:%S")
Times0   <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
Times1   <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")

## subset and create array tt
d1 <- subset(d0, Times >= Times0 & Times < Times1 )
tt <- as.numeric((d1$Times-Times0)/86400.0)

## Plot2
png(filename="plot2.png",width=480,height=480,units="px")

plot(tt,d1$Global_active_power,
     ylab="Global active power (kilowatts)",
     type="l",lty=1,
     xaxp=c(0,2,2),xaxt="n",xlab="")  # suppress x label and ticks
                 
## add x axis with given ticks and tickmarks at given locations                 
axis(1,at=0:2,labels=c("Thu","Fri","Sat")) 

dev.off()
