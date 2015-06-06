## Reading the full dataset
dataset <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

## Subsetting the data of interest
dataPartial <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)

## Converting dates as required
datetime <- paste(as.Date(dataPartial$Date), dataPartial$Time)
dataPartial$Datetime <- as.POSIXct(datetime)

## Creating the Plot #1
hist(dataPartial$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()