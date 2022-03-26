#Read in the data and filter
Data <- read.table("/Users/niteshchampaneri/Desktop/00. Date Science/4. Exploratory Data Analysis/household_power_consumption.txt", header = TRUE, sep = ";")
Data1 <- subset(Data, Data$Date == "1/2/2007" | Data$Date == "2/2/2007")


#Transform Date and Time to appropriate format
Data1$Time <- strptime(Data1$Time, format = "%H:%M:%S")
Data1$Date <- as.Date(Data1$Date, format = "%d/%m/%Y" )
Data1[1:1440,"Time"] <- format(Data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
Data1[1441:2880,"Time"] <- format(Data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Plot graph
par(mfrow=c(2,2))

with(Data1,{
    plot(Data1$Time,as.numeric(Data1$Global_active_power)
    ,type = "l"
    ,xlab = ""
    ,ylab = "Global Active Power"
    )  
    plot(Data1$Time,as.numeric(Data1$Voltage)
    ,type = "l"
    ,xlab = "datetime"
    ,ylab = "Voltage"
    )
plot(Data1$Time, Data1$Sub_metering_1 
     ,xlab = ""
     ,ylab = "Energy Sub metering"
     ,type = "l"
)
with (Data1, lines(Time, Data1$Sub_metering_2, col = "red"))
with (Data1, lines(Time, Data1$Sub_metering_3, col = "blue"))
legend("topright" 
       ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty=1
       ,col=c("black", "red", "blue"))

    plot(Data1$Time,as.numeric(Data1$Global_reactive_power)
    ,type = "l"
    ,xlab = "datetime"
    ,ylab = "Global_reactive_power")
})
