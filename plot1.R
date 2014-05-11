plot1<-function()
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
   
  # plotting
  png(file="plot1.png",width=480,height=480)
  hist(as.numeric(udata$Global_active_power),col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
}