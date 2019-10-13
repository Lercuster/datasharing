
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
global_active_power <- as.numeric(subdata$Global_active_power)


png("plot2.png", width = 480, height = 480)
plot(date, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()