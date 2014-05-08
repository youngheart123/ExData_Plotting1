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

## Plot4
png(filename="plot4.png",width=480,height=480,units="px")
par_default <- par(no.readonly=TRUE)
par(omi=c(0,0,0,0),mfrow=c(2,2),mar=c(4.1,4.1,1.5,2.1),cex=1)                 

## upper left panel
plot(tt,d1$Global_active_power,
     ylab="Global active power",
     type="l",lty=1,
     xaxp=c(0,2,2),xaxt="n",xlab="")  # suppress x label and ticks
axis(1,at=0:2,labels=c("Thu","Fri","Sat")) 

                 
## upper right panel
plot(tt,d1$Voltage,
     ylab="Voltage",
     type="l",lty=1,
     xaxp=c(0,2,2),xaxt="n",xlab="datetime")  # suppress x label and ticks

## add x axis with given ticks and tickmarks at given locations                 
axis(1,at=0:2,labels=c("Thu","Fri","Sat")) 
                 
## lower left panel                 
plot(tt,d1$Sub_metering_1,
     ylab="Energy sub metering",
     type="l",lty=1,col="black",
     xaxp=c(0,2,2),xaxt="n",xlab="")  # suppress x label and ticks
lines(tt,d1$Sub_metering_2,col="red")
lines(tt,d1$Sub_metering_3,col="blue")
                 
## plot legend
legend(0.85,40,legend = names(d1)[7:9],
     text.width=strwidth(names(d1)[7]),
     xjust=0, yjust=1,lty=1,cex=0.7,
     col=c("black","red","blue"),bty="n")

                 
## add x axis with given ticks and tickmarks at given locations                 
     axis(1,at=0:2,labels=c("Thu","Fri","Sat"))

## bottom right panel
plot(tt,d1$Global_reactive_power,
     ylab="Global_reactive_power",
     type="l",lty=1,
     xaxp=c(0,2,2),xaxt="n",xlab="datetime")
axis(1,at=0:2,labels=c("Thu","Fri","Sat")) 

## close currrent graphics device
dev.off()

## reset par to default
par(par_default)