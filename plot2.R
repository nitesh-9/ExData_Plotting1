#Read in the data and filter
Data <- read.table("/Users/niteshchampaneri/Desktop/00. Date Science/4. Exploratory Data Analysis/household_power_consumption.txt", header = TRUE, sep = ";")
Data1 <- subset(Data, Data$Date == "1/2/2007" | Data$Date == "2/2/2007")

#Transform Date and Time to appropriate format
Data1$Time <- strptime(Data1$Time, format = "%H:%M:%S")
Data1$Date <- as.Date(Data1$Date, format = "%d/%m/%Y" )
Data1[1:1440,"Time"] <- format(Data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
Data1[1441:2880,"Time"] <- format(Data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#Creating the plots
plot(Data1$Time, as.numeric(Data1$Global_active_power)
     ,ylab = "Global Active Power (kilowatts)"
     ,xlab = ""
     ,type = "l"
     ,)
