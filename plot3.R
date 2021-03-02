setwd("/Users/francescoaldo/Desktop/COURSES MATERIAL/R DATA SCIENCE - Coursera/c4_w1_ProgAss") 
# library()  

pc <- read.table("/Users/francescoaldo/Desktop/COURSES MATERIAL/R DATA SCIENCE - Coursera/c4_w1_ProgAss/household_power_consumption.txt", 
                                header = TRUE , sep=";") 
## Please refer to plot2.R for details 
pc$DateTime <- paste(pc$Date, pc$Time) 
pc$DateTime <- strptime(pc$DateTime, format = "%d/%m/%Y %H:%M:%S") 
pc$Sub_metering_1 <- as.numeric(pc$Sub_metering_1) 
pc$Sub_metering_2 <- as.numeric(pc$Sub_metering_2) 
pc$Sub_metering_3 <- as.numeric(pc$Sub_metering_3) 
plot.sample <- subset(pc, pc$Date == "1/2/2007" | pc$Date == "2/2/2007") 
# Let's start with a "blank canvas" plot by setting type = "n" 
# (the Base plotting system follows the "Artist's Palette" model afterall...) 

# To get a .png file: 
# png(filename = "plot3.png", width = 600, height = 500) 

plot(plot.sample$DateTime, 
     plot.sample$Sub_metering_1, 
     type = "n", 
     xlab = "", 
     ylab = "Energy sub metering") 
# Let's use the with() function to operate "inside" the plot.sample dataset, 
# thus avoiding excessive typing (...)  
with(plot.sample, lines(DateTime, Sub_metering_1)) 
with(plot.sample, lines(DateTime, Sub_metering_2, col = "red")) 
with(plot.sample, lines(DateTime, Sub_metering_3, col = "blue")) 
# ...and then let's add a legend as in the plot in the instructions 
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
       ) 
# Finally, let's add the title with a simple annotation: 
title(main = "Energy sub-metering") 

# dev.off() 



