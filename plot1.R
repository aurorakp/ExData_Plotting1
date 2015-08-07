## Read in the relevant data

## Select only the data we need and put it in a file for easier access

baseFileName <- paste("household_power_consumption.txt",sep=",")

startpt <- 66638
endpt <- 69518

trimmedData <- scan(file=baseFileName,what = character(), nmax = 2880,skip=66637)
trimmedNames <- scan(file=baseFileName,what = character(), nmax = 1)
trimmedTotal <- append(trimmedNames, trimmedData)

outfile <- paste("hpctrimmed.txt",sep="")
write(trimmedTotal,outfile)

## Process the trimmed data:

tdata <- read.table(outfile, header = TRUE, sep = ";")

tdata$dateandtime <- strptime(paste(tdata$Date,tdata$Time),"%d/%m/%Y %H:%M:%S")
## Set up the png for the first plot and store the histogram:

pngout1 <- paste("plot1.png",sep="")

png(pngout1)
hist(tdata$Global_active_power,breaks = 12, col = "red", xlab="Global Active Power(kilowatts)", ylab = "Frequency",main = "Global Active Power", ylim = c(0,1200))
dev.off()



