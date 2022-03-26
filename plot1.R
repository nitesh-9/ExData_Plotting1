#Read in the data and filter
Data <- read.table("/Users/niteshchampaneri/Desktop/00. Date Science/4. Exploratory Data Analysis/household_power_consumption.txt", header = TRUE, sep = ";")
Data1 <- subset(Data, Data$Date == "1/2/2007" | Data$Date == "2/2/2007")


#Creating the plots
hist(as.numeric(Data1$Global_active_power), 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
