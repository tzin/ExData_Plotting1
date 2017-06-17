## Plot 1

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

## Plot 1
hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## export file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()