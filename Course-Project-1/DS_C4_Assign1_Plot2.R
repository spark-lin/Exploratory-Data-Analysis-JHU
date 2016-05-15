
rm(list=ls())
#reading data into R:
cons<-read.table('/Users/smilingtaki/Desktop/Coursera/DS_C4_Week1_Assign/household_power_consumption.txt',sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subset the full data to obtain the data related to two days["1/2/2007","2/2/2007"]:
sub<- subset(cons, (cons$Date == "1/2/2007" | cons$Date== "2/2/2007"))

# Change the class of Date variable from character to Date format["%d/%m/%Y"]: 
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")

# Combine the Date and Time variable, then create a new column in dataset named "DateTime":
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

# Create the plot2 as required wid=480 and hgt=480::
png("plot2.png", width = 480, height = 480)
plot(sub$DateTime, sub$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)", xlab="")
dev.off()
