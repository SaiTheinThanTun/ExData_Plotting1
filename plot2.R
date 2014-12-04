#Plot2
hhpc <- read.csv("household_power_consumption.txt", sep= ";") #Assuming the require file has been extracted into the working directory
hhpc$Date <- as.Date(hhpc$Date, "%d/%m/%Y")
hhpc_sub <- hhpc[hhpc$Date=="2007-02-01"|hhpc$Date=="2007-02-02",]
#hhpc_sub$datetime <- format(strptime(paste(hhpc_sub$Date,hhpc_sub$Time, sep=" "),"%Y-%m-%d %H:%M:%S"), "%a")
for(i in 3:8){
  hhpc_sub[,i] <- as.numeric(as.character(hhpc_sub[,i])) #Change factors into numerics
}
#hhpc_sub$Global_active_power <- as.numeric(as.character(hhpc_sub$Global_active_power)) #Change to numeric
hhpc_sub$datetime <- strptime(paste(hhpc_sub$Date,hhpc_sub$Time, sep=" "),"%Y-%m-%d %H:%M:%S")
png("plot2.png")


with(hhpc_sub, plot(datetime, Global_active_power, type= "s", ylab="Global Active Power (watts)", xlab=""))
dev.off()