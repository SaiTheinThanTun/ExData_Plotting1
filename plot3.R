#Plot3
hhpc <- read.csv("household_power_consumption.txt", sep= ";") #Assuming the require file has been extracted into the working directory
hhpc$Date <- as.Date(hhpc$Date, "%d/%m/%Y")
hhpc_sub <- hhpc[hhpc$Date=="2007-02-01"|hhpc$Date=="2007-02-02",]
#hhpc_sub$datetime <- format(strptime(paste(hhpc_sub$Date,hhpc_sub$Time, sep=" "),"%Y-%m-%d %H:%M:%S"), "%a")
for(i in 3:8){
  hhpc_sub[,i] <- as.numeric(as.character(hhpc_sub[,i])) #Change factors into numerics
}
#hhpc_sub$Global_active_power <- as.numeric(as.character(hhpc_sub$Global_active_power)) #Change to numeric
hhpc_sub$datetime <- strptime(paste(hhpc_sub$Date,hhpc_sub$Time, sep=" "),"%Y-%m-%d %H:%M:%S")
png("plot3.png")


with(hhpc_sub, plot(datetime, Sub_metering_1, type= "s", xlab="", ylab="Energy sub metering"))
points(hhpc_sub$datetime, hhpc_sub$Sub_metering_2, type= "s", col="red")
points(hhpc_sub$datetime, hhpc_sub$Sub_metering_3, type= "s", col="blue")
legend("topright", pch= "_", col= c("black","red", "blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
