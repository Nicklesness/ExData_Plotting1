
read_and_plot1 <- function(){
        library(dplyr)
        library(chron)
        df1 <- tbl_df(read.table(file =  "household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE))
        df1$Date <- as.Date(df1$Date, format = "%d/%m/%Y")
        df1$Time <- times(df1$Time) ## use chron packsge to set times in correct class
        df1 <<- filter(df1, Date >= "2007-02-01" & Date <= "2007-02-02")## filter dataset
        
        png(filename = "plot1.png", width = 480, height = 480)
        hist(df1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
        
}



