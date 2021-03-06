##Once the household_power_consumption.txt file is downloaded, read the file

powerconsump_file <- "household_power_consumption.txt"

##Read the full file
data_full <- read.table(powerconsump_file, header=T, sep=";", na.strings="?")

## Converting time variable
final_Data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(final_Data$Date, final_Data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
final_Data <- cbind(SetTime, final_Data)

## Create Plot 2
plot(final_Data$SetTime, final_Data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Saving the plot in png format of width 480 pixels and height 480 pixels
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()