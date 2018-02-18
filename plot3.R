##Once the household_power_consumption.txt file is downloaded, read the file

powerconsump_file <- "household_power_consumption.txt"

##Read the full file
data_full <- read.table(powerconsump_file, header=T, sep=";", na.strings="?")

## Converting time variable
final_Data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(final_Data$Date, final_Data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
final_Data <- cbind(SetTime, final_Data)

## Generating Plot 3
columns_define <- c("black", "red", "blue")
labels_define <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(final_Data$SetTime, final_Data$Sub_metering_1, type="l", col=columns_define[1], xlab="", ylab="Energy sub metering")
lines(final_Data$SetTime, final_Data$Sub_metering_2, col=columns_define[2])
lines(final_Data$SetTime, final_Data$Sub_metering_3, col=columns_define[3])
legend("topright", legend=labels_define, col=columns_define, lty="solid")

#Saving the plot in png format of width 480 pixels and height 480 pixels
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()