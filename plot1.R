setwd("/Users/francescoaldo/Desktop/COURSES MATERIAL/R DATA SCIENCE - Coursera/c4_w1_ProgAss") 
# library()  

power.consumption <- read.table("/Users/francescoaldo/Desktop/COURSES MATERIAL/R DATA SCIENCE - Coursera/c4_w1_ProgAss/household_power_consumption.txt", 
                                header = TRUE , sep=";") 
# Take a look at the data 
class(power.consumption) 
dim(power.consumption) # a 2,075,259 x 9 data frame 
head(power.consumption, 3) 
tail(power.consumption, 3) 

# We want to extract the data for 01/02/2007 and 02/02/2007 only 
# First, we have to inspect whether the data are of the right mode... 
class(power.consumption$Date) 
class(power.consumption$Global_active_power) 

power.consumption$Date <- as.Date(power.consumption$Date, "%d/%m/%Y") 
class(power.consumption$Date) # check: class "Date" ok 

# As per instructions, missing values are coded as "?" here 
sum(power.consumption$Global_active_power == "?") 
# There are 25979 missing values for the variable of interest 
power.consumption$Global_active_power <- as.numeric(power.consumption$Global_active_power) 
# Exactly 25979 NAs produced 

plot.sample <- subset(power.consumption, 
                      power.consumption$Date ==  "2007-02-01" | 
                      power.consumption$Date == "2007-02-02") 

# Let's create the histogram for plot1 (sending it to screen device for checking) 

hist(plot.sample$Global_active_power, col = "red", main = "Global Active Power", 
                                      xlab = "Global Active Power (kilowatts)") 

# Let's now write the code to export it as a .png file 
# png(filename = "plot1.png", width = 480, height = 480) 
# hist(plot.sample$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)") 
# dev.off() 

## NOTE that I actually saved plot1.png using the "Export" icon in RStudio, 
# since it allows to adjust width and height "interactively" and choose 
# (if needed) the directory where to store it! 

##### NOTE that we don't need to exclude missing values
# The following code produce the same histogram! 
try <- plot.sample$Global_active_power 
try <- try[complete.cases(try)] 
hist(try, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)") 





