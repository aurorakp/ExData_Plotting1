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

## Change the date and time into a nicer format for R

tdata$dateandtime <- strptime(paste(tdata$Date,tdata$Time),"%d/%m/%Y %H:%M:%S")


## Set up the png for the third plot and store the graph:

pngout3 <- paste("plot3.png",sep="")

# Set up colors for lines, a range for the y-axis, and the legend:

plotcolors <- c("Black","Red","Blue")
plotyrange <- range(c(tdata$Sub_metering_1, tdata$Sub_metering_2, tdata$Sub_metering_3)) 
plotnames <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")

png(pngout3)

# Use par to ensure lines are plotted correctly on the same canvas:

plot(tdata$dateandtime, tdata$Sub_metering_1, ylim = plotyrange, col = plotcolors[1], type="l", xlab = "", ylab = "Energy sub metering")
par(new=TRUE)
plot(tdata$dateandtime, tdata$Sub_metering_2, ylim = plotyrange, col = plotcolors[2], type="l", ann=FALSE, axes=FALSE, xlab="", ylab = "")
par(new=TRUE)
plot(tdata$dateandtime, tdata$Sub_metering_3, ylim = plotyrange,col = plotcolors[3], type="l", ann=FALSE, axes=FALSE, xlab="", ylab = "")
legend("topright",plotnames,col = plotcolors, lty = 1)

dev.off()