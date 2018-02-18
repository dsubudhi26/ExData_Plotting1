##Once the household_power_consumption.txt file is downloaded, read the file

powerconsump_file <- "household_power_consumption.txt"

##Read the full file
data_full <- read.table(powerconsump_file, header=T, sep=";", na.strings="?")

## Converting time variable
final_Data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(final_Data$Date, final_Data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
final_Data <- cbind(SetTime, final_Data)

## Generating Plot 4
columns_define <- c("black","red","blue")
labels_define <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")

par(mfrow=c(2,2))
plot(final_Data$SetTime, final_Data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(final_Data$SetTime, final_Data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(final_Data$SetTime, final_Data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(final_Data$SetTime, final_Data$Sub_metering_2, type="l", col="red")
lines(final_Data$SetTime, final_Data$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels_define, lty=1, col=columns_define)
plot(final_Data$SetTime, final_Data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Saving the plot in png format of width 480 pixels and height 480 pixels
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()