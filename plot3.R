plot3<-function() 
{
  # file and folder name
  filename<-"household_power_consumption.txt"
  dataSourceDir<-"data"
  
  # filepath
  sourceloc=sprintf("%s/%s",dataSourceDir,filename)
  
  # reading table
  data<-read.csv(sourceloc, sep=";",header=TRUE,stringsAsFactors=FALSE)
  data$Date=as.Date(data$Date,"%d/%m/%Y")
  
  # subseting data
  udata<-subset(data, Date>'2007-01-31' & Date<'2007-02-03')
  
  # Date Time conversion
  udata$DateTime=strptime(paste(udata$Date,udata$Time),format= "%Y-%m-%d %H:%M:%S")
  
  # English language for days on xlab
  Sys.setlocale("LC_TIME", "C")
  
  # plotting
  png(file="plot3.png",width=480,height=480)
  plot(udata$DateTime,as.numeric(udata$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
  lines(udata$DateTime,as.numeric(udata$Sub_metering_2),col="red")
  lines(udata$DateTime,as.numeric(udata$Sub_metering_3),col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
  dev.off()
}
