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

## Set up the png for the second plot and store the graph:

pngout2 <- paste("plot2.png",sep="")

png(pngout2)

plot(tdata$dateandtime, tdata$Global_active_power, type="l", ann=T, xlab = "", ylab = "Global Active Power(kilowatts)")
box()

dev.off()

