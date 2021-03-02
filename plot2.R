setwd("/Users/francescoaldo/Desktop/COURSES MATERIAL/R DATA SCIENCE - Coursera/c4_w1_ProgAss") 
# library()  

power.consumption <- read.table("/Users/francescoaldo/Desktop/COURSES MATERIAL/R DATA SCIENCE - Coursera/c4_w1_ProgAss/household_power_consumption.txt", 
                                header = TRUE , sep=";") 
# Take a look at the data 
# class(power.consumption) 
# dim(power.consumption) # a 2,075,259 x 9 data frame 
# head(power.consumption, 3) 
# tail(power.consumption, 3) 
# We want to extract the data for 1/2/2007 and 2/2/2007 only 
# I'll explore a different route from the one used in plot1.R (useful for later) 
# First, let's paste Date & Time into a single (character, for now) variable: 
power.consumption$DateTime <- paste(power.consumption$Date, 
                                    power.consumption$Time) 
# Then, we change it to a POSIXlt object with strptime(): 
power.consumption$DateTime <- strptime(power.consumption$DateTime, 
                                       format = "%d/%m/%Y %H:%M:%S") 
class(power.consumption$DateTime) # returns: [1] "POSIXlt" "POSIXt" 

# Changing variable of interest to numeric... 
power.consumption$Global_active_power <- as.numeric(power.consumption$Global_active_power) 

# Let's now subset the data: 
plot.sample <- subset(power.consumption, 
                      power.consumption$Date == "1/2/2007" | 
                      power.consumption$Date == "2/2/2007") 
# plot.sample <- plot.sample[, c("DateTime", "Global_active_power")] 
head(plot.sample, 3) 
str(plot.sample) 

# Let's try the plot, setting type = "l" for 'line' 
# x-axis: Time & Date variable ; y-axis: GAP variable 
# dev.off() # optional, to ensure we get screen device 
# (gives error if already in null device) 

plot(x = plot.sample$DateTime, 
     y = plot.sample$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)") 

## PLEASE NOTE that my locale is set to Italy, and unfortunately I cannot 
# change it for now (I need it for other stuff!), so to help you: 
# "Gio" stands for 'Giovedì', which is Thursday; 
# "Ven" stands for 'venerdì', which is Friday; 
# "Sab" stands for 'Sabato', which is --you've guessed it-- Saturday 

## Now, let's print it to a PGN file device: 
# png(filename = "plot2.png", width = 480, height = 480) 
# plot(x = plot.sample$DateTime, y = plot.sample$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") 
# dev.off() 





