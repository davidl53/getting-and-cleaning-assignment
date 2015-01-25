## run_analysis.R -  script for course assignment

## load dplyr
library(dplyr)
library(data.table)

## Read the data files
dta<-read.table("test/X_test.txt")   
dta2<-read.table("train/X_train.txt")

## Read the activity files
a<-read.table("test/y_test.txt")
a2<-read.table("train/y_train.txt")

##Read the subject files
s<-read.table("test/subject_test.txt")
s2<-read.table("train/subject_train.txt")

## Name the column for each subject/ activity file
names(s)<-"subject"
names(s2)<-"subject"
names(a)<-"activity"
names(a2)<-"activity"



#* ITEM 4 IN ASSIGNMENT LIST **
## read the column names for the data files from features.txt
colNames<-read.table("features.txt")

## Add the descriptive column names to each data file 
names(dta) <- colNames[,2]
names(dta2) <- colNames[,2]

## construct the data files with subject and activity columns
data1<-cbind(s,a,dta)
data2<-cbind(s2,a2,dta2)


#** ITEM 1 IN ASSIGNMENT LIST **
    ## add the rows of data2 (training data) to data1 (test data)
merged<-rbind(data1,data2)

##** ITEM 2 IN ASSIGNMENT LIST **
    ## create vector of column numbers containing "mean" or "std"
choices <- sort(c(grep("mean",names(merged)),grep("std",names(merged))))

    ## add the first 2 columns (subject and activity) to be selected)
choices <- c(1,2,choices)

## subset the columns 
data <- merged[,choices]
## Remove columns with "meanFreq"data
choices <-  c(grep("meanFreq",names(data)))
data <- data[,-choices]

#** ITEM 3 IN ASSIGNMENT LIST **
    ##Read the descriptive activity labels
activities<-read.table("activity_labels.txt")

    ## make vector of activity descriptive names
act<-activities[,2]

    ##  change numerical activity labels to descriptive
data <- mutate(data,activity=act[activity])


#** ITEM 5 IN ASSIGNMENT LIST **
    ##using data.table to calculate mean of variables grouped by subject and activity

DT <- data.table(data)
tidy_data<-DT[,lapply(.SD,mean),by=c("subject","activity")]
write.table(tidy_data, file="tidy data.txt",row.names=FALSE)
## Phew!! Finished.


                



