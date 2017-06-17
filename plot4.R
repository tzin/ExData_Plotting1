## Plot 4

## Load the dataset
## Get data from 2007-02-01 to 2007-02-02 
file = "household_power_consumption.txt"
headers = read.csv(file, header = F, nrows = 1, as.is = T,na.strings="?", sep=";")
df = read.table(file, skip = 66638, header = F,nrows=2880, na.strings="?", sep=";") #1440 rows per day
colnames(df)= headers 

## Convert date and time variables to date/time classes 
library(timeDate)
df$Date <- as.Date(df$Date,format="%d/%m/%Y") 
df$Date <- format(df$Date, "%Y-%m-%d")
df$Time <- strptime(df$Time,"%H:%M:%S")
df$Time <- strftime(df$Time, '%H:%M:%S')
df$DateTime <- strptime(paste(df$Date,df$Time),"%Y-%m-%d %H:%M:%S")

## Plot 4

par(mfrow = c(2, 2))

with({
  
  plot(x=df$DateTime, y=df$Global_active_power, type="l", ylab="Global Active Power",xlab="")
  
  plot(x=df$DateTime, y=df$Voltage,type="l", ylab="Voltage", xlab="datetime")
  
  plot(x=df$DateTime,y=df$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  lines(x=df$DateTime,y=df$Sub_metering_2,col="red")
  lines(x=df$DateTime,y=df$Sub_metering_3,col="blue")
  legend("topright", lwd = 1, cex=0.4, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(df$DateTime, df$Global_reactive_power, type = "l", main = "",ylab="Global_reactive_power", xlab = "datetime")
  
  })


## export file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
