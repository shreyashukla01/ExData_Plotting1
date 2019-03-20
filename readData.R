## this file specifically reads the data and create a dataframe that we use for plotting our graphs
## I have created a separate file to avoid calling the same commands from different plot files.
## evaluators should run this file first to prepare a clean data frame named "result" 
## which is used in the plot preparation

##to start,  download the file in data folder in the current working directory
## then extract it in the same folder
## execute this scipt in the current working directory

url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile = "./data/extdata.zip")
outDir<-"./data/extdata"
unzip("./data/extdata.zip",exdir=outDir)

# read table and extract info for the dates specified
pctable<-read.table("./data/extdata/household_power_consumption.txt", stringsAsFactors = FALSE)

cols<-strsplit(as.character(pctable[1,1]),split = ";")[[1]]

data1<-grep(pattern = "^1/2/2007", pctable$V1, value = TRUE)

data2<-grep(pattern = "^2/2/2007", pctable$V1, value = TRUE)

data1<-as.data.frame(data1)

data2<-as.data.frame(data2)

colnames(data1)<-"V1"
colnames(data2)<-"V1"

data<-rbind(data1,data2)

data$V1<-paste("0",data$V1,sep="")
data$V1<-sub("/","/0",data$V1)

##function created to ease create a clean data frame from single column data frame

createdf<-function(x){
  df <- data.frame(matrix(ncol = 9, nrow = 0))
  colnames(df)<-cols
  for(i in 1:nrow(x)){
    m<-strsplit(as.character(x[i,]),split = ";")
    for(j in 1:9){
      df[i,j]<-(m[[1]][j])
    }
  }
  df
}


result<-createdf(data)
result$Date<-gsub("/","-",result$Date)

## concatenating date and time column to create single column

result$DateTime <- paste(result$Date,result$Time,sep = " ")

## removing date and time columns(optional)

result<-result[,!(names(result) %in% (c("Date", "Time")))]

## converting DateTime column to appropriate column

result$DateTime<-strptime(result$DateTime, "%d-%m-%Y %H:%M:%S")

