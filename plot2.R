
read_and_plot2 <- function(){
        library(dplyr)
        library(chron)
        library(lubridate)
        df1 <- tbl_df(read.table(file =  "household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE))
        df1$Date <- as.Date(df1$Date, format ="%d/%m/%Y")
        df1 <- filter(df1, Date >= "2007-02-01" & Date <= "2007-02-02")## filter dataset
        df1 <- mutate(df1, right_date = paste(df1$Date, df1$Time))
        df1$right_date <- as.POSIXlt(df1$right_date, format = "%Y-%m-%d %H:%M:%S")
        
        png(filename = "plot2.png", width = 480, height = 480)
        plot(df1$right_date, df1$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
        dev.off()
        
}
