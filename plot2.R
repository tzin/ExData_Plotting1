## Plot 2

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

## Plot 2
plot(y=df$Global_active_power,x=df$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## export file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()