
fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dest_file = ".\\data\\cp1.zip"

if(!file.exists(dest_file)){ 
  download.file(fileurl, dest_file)
} else {
  print("already downloaded")
}
if(!file.exists(".\\data\\qq")){ 
  unzip(dest_file, exdir = ".\\data\\qq")
} else {
  print("already unziped")
}

data <- read.table(".\\data\\qq\\household_power_consumption.txt",
                   sep = ";", header = T, stringsAsFactors = F)
subdata <- data[ data$Date %in% c("1/2/2007", "2/2/2007"), ]

date <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subdata$Sub_metering_1)
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(date, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date, subMetering2, type="l", col="red")
lines(date, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()