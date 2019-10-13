
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
global_active_power <- as.numeric(subdata$Global_active_power)


png("plot1.png", width = 480, height = 480)
hist(global_active_power, col= "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()