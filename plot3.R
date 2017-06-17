## Plot 3

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

## Plot 3
plot(x=df$DateTime,y=df$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=df$DateTime,y=df$Sub_metering_2,col="red")
lines(x=df$DateTime,y=df$Sub_metering_3,col="blue")
legend("topright", lwd = 1, bty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## export file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()