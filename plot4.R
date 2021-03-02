setwd("/Users/francescoaldo/Desktop/COURSES MATERIAL/R DATA SCIENCE - Coursera/c4_w1_ProgAss") 
# library()  

pc <- read.table("/Users/francescoaldo/Desktop/COURSES MATERIAL/R DATA SCIENCE - Coursera/c4_w1_ProgAss/household_power_consumption.txt", 
                 header = TRUE , sep=";") 

pc$DateTime <- paste(pc$Date, pc$Time) 
pc$DateTime <- strptime(pc$DateTime, format = "%d/%m/%Y %H:%M:%S") 
pc$Global_active_power <- as.numeric(pc$Global_active_power) 
pc$Sub_metering_1 <- as.numeric(pc$Sub_metering_1) 
pc$Sub_metering_2 <- as.numeric(pc$Sub_metering_2) 
pc$Sub_metering_3 <- as.numeric(pc$Sub_metering_3) 
plot.sample <- subset(pc, pc$Date == "1/2/2007" | pc$Date == "2/2/2007") 

# png(filename = "plot4.png", width = 650, height = 500) 

# Let's set a 2x2 panel (i.e. 2 graphs per row, 2 per column) 
par(mfrow = c(2,2)) 

with(plot.sample, { 
          plot(plot.sample$DateTime, plot.sample$Global_active_power, 
               type = "l", xlab = "", ylab = "Global Active Power") 
          plot(plot.sample$DateTime, plot.sample$Voltage, 
               type = "l", xlab = "datetime", ylab = "Voltage") 
          plot(plot.sample$DateTime, plot.sample$Sub_metering_1, 
               type = "n", xlab = "", ylab = "Energy sub metering") 
            with(plot.sample, lines(DateTime, Sub_metering_1)) 
            with(plot.sample, lines(DateTime, Sub_metering_2, col = "red")) 
            with(plot.sample, lines(DateTime, Sub_metering_3, col = "blue")) 
            legend("topright", lty = 1, col = c("black", "red", "blue"), 
                   legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   cex = 0.6) 
          plot(plot.sample$DateTime, plot.sample$Global_reactive_power, 
               type = "l", xlab = "datetime", ylab = "Global_reactive_power") 
}) 

# dev.off() 







