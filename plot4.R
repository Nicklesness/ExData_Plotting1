read_and_plot4 <- function(){
        library(dplyr)
        library(chron)
        library(lubridate)
        df1 <- tbl_df(read.table(file =  "household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE))
        df1$Date <- as.Date(df1$Date, format ="%d/%m/%Y")
        df1 <- filter(df1, Date >= "2007-02-01" & Date <= "2007-02-02")## filter dataset
        df1 <- mutate(df1, right_date = paste(df1$Date, df1$Time))
        df1$right_date <- as.POSIXlt(df1$right_date, format = "%Y-%m-%d %H:%M:%S")
        
        #set parametrs to big plot
        png(filename = "plot4.png", width = 480, height = 480)
        par(mfrow=c(2,2))
        
        ##1
        plot(df1$right_date, df1$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
        
        ##2
        plot(df1$right_date, df1$Voltage, xlab = "Datetime", ylab = "Voltage", type = "l")
        
        
        ##3
        plot(df1$right_date,df1$Sub_metering_1 , type = "n", xlab = "", ylab = "Energy sub metering")
        points(x = df1$right_date, y = df1$Sub_metering_1, col = "black" , type = "l")
        points(x = df1$right_date, y = df1$Sub_metering_2, col = "red" , type = "l")
        points(x = df1$right_date, y = df1$Sub_metering_3, col = "blue" , type = "l")
        
        ##4
        plot(df1$right_date, df1$Global_reactive_power, xlab = "Datetime", ylab = "Global_reactive_power", type = "l")
        dev.off()
        }