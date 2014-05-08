## read data
d0 <- read.table("household_power_consumption.txt",header=T,
                 sep=";",nrows=-1,stringsAsFactors=F,na.strings="?")

## date and time conversion
d0$Times <- strptime(paste(d0$Date, d0$Time), "%d/%m/%Y %H:%M:%S")
Times0   <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
Times1   <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")

d1 <- subset(d0, Times >= Times0 & Times < Times1 )

## output plot to a PNG format file
png(filename="plot1.png",width=480,height=480,units="px")
par_default <- par(no.readonly=TRUE)

## Plot1
hist(d1$Global_active_power,
    col="red", # set color
    main="Global active power", # set title
    xlab="Global active power (kilowatts)") # set x label

## close current graphic device
dev.off()


