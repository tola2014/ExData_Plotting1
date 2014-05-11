plot2<-function()
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
  
  #plotting
  png(file="plot2.png",width=480,height=480)
  plot(udata$DateTime,as.numeric(udata$Global_active_power),type="l",xlab="", ylab="Global active power (kilowatts)")
  dev.off()
}