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

## Plot3
png(filename="plot3.png",width=480,height=480,units="px")

plot(tt,d1$Sub_metering_1,
     ylab="Energy sub metering",
     type="l",lty=1,col="black",
     xaxp=c(0,2,2),xaxt="n",xlab="")  # suppress x label and ticks
lines(tt,d1$Sub_metering_2,col="red")
lines(tt,d1$Sub_metering_3,col="blue")

## plot legend
legend("topright",legend = names(d1)[7:9],
       text.width=strwidth(names(d1)[7]),
       xjust=1, yjust=1,lty=1,
       col=c("black","red","blue"),cex=0.8)
#text(temp$rect$left + temp$rect$w, temp$text$y,
#     names(d1)[7:9], pos = 2)

## add x axis with given ticks and tickmarks at given locations                 
axis(1,at=0:2,labels=c("Thu","Fri","Sat")) 

## close current graphics device
dev.off()
