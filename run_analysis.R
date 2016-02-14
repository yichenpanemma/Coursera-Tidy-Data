path <- getwd()
path
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "Dataset.zip"
if (!file.exists(path)) {dir.create(path)}
download.file(url, file.path(path, f))
##======================================================
##Please use UnRAR expander here!
pathIn <- file.path(path, "UCI HAR Dataset")
##======================================================
library(data.table)
test.y <- fread(file.path(pathIn, "test" , "Y_test.txt" ))
test.y<-data.table(test.y)
test.x  <- fread(file.path(pathIn, "test" , "X_test.txt" ))
test.x<-data.table(test.x)
test.s  <- fread(file.path(pathIn, "test" , "subject_test.txt" ))
test.s<-data.table(test.s)

train.y <- fread(file.path(pathIn, "train", "Y_train.txt"))
train.y<-data.table(train.y)
train.x <- fread(file.path(pathIn, "train", "X_train.txt"))
train.x<-data.table(train.x)
train.s<- fread(file.path(pathIn, "train", "subject_train.txt"))
train.s<-data.table(train.s)

x<-rbind(test.x, train.x)
s<-rbind(test.s, train.s)
setnames(s, "V1", "subject")
y<-rbind(test.y, train.y)
setnames(y, "V1", "activity")

##Merges the training and the test sets to create one data set.
sy<-cbind(s,y)
syx<-cbind(sy,x)

##======================================================
feature<- fread(file.path(pathIn, "features.txt"))
feature<-data.table(feature)

names<-names(syx)[3:563]
newnames<-as.character(feature$V2)
setnames(syx,names(syx)[3:563],newnames)
##select names: true/false
names.meanstd<-grepl("mean\\(\\)|std\\(\\)", names(syx))
names.syx<-names(syx)
names.select<-names.syx[names.meanstd]
##select variables subsets
var<-seq(1,563,by=1)
data<-cbind(var,names.meanstd)
data<-as.data.frame(data)
data1<-data[(data$names.meanstd==1),]
setnames(syx,names(syx)[3:563],names)

library(dplyr)
select.dt<-select(syx,data1$var)

subject<-(syx$subject)
subject<-as.data.frame(subject)
select.dt<-cbind(subject, select.dt)
activity<-(syx$activity)
activity<-as.data.frame(activity)
select.dt<-cbind(activity, select.dt)
select.dt$activity[select.dt$activity==1]<-"WALKING"
select.dt$activity[select.dt$activity==2]<-"WALKING_UPSTAIRS"
select.dt$activity[select.dt$activity==3]<-"WALKING_DOWNSTAIRS"
select.dt$activity[select.dt$activity==4]<-"SITTING"
select.dt$activity[select.dt$activity==5]<-"STANDING"
select.dt$activity[select.dt$activity==6]<-"LAYING"
select.dt$activity<-as.character(select.dt$activity)
##======================================================

a<-factor(select.dt$activity)
s<-factor(select.dt$subject)
##======================================================
v1<-select.dt[,3]
v1<-tapply(v1,a,mean)
t(v1)

v2<-select.dt[,4]
v2<-tapply(v2,a,mean)
t(v2)

   new.dt<-rbind(v1,v2)
      v <- vector("list", length(6))
      out <- vector("list", length(6))
for(i in 3:66){
out[[i]]<-tapply(select.dt[,i+2],a,mean)
v[[i]]<-t(out[[i]])
new.dt<-rbind(new.dt,v[[i]])
i=i+1
}
##======================================================
n1<-select.dt[,3]
n1<-tapply(n1,s,mean)
t(n1)

n2<-select.dt[,4]
n2<-tapply(n2,s,mean)
t(n2)

   new2.dt<-rbind(n1,n2)
      n <- vector("list", length(30))
      out.n <- vector("list", length(30))
for(i in 3:66){
out.n[[i]]<-tapply(select.dt[,i+2],s,mean)
n[[i]]<-t(out.n[[i]])
new2.dt<-rbind(new2.dt,n[[i]])
i=i+1
}
##======================================================
rownames<-c("tBodyAcc-mean()-X","tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tBodyAcc-std()-X","tBodyAcc-std()-Y"
,"tBodyAcc-std()-Z","tGravityAcc-mean()-X","tGravityAcc-mean()-Y"
,"tGravityAcc-mean()-Z","tGravityAcc-std()-X","tGravityAcc-std()-Y"
,"tGravityAcc-std()-Z","tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y","tBodyAccJerk-mean()-Z","tBodyAccJerk-std()-X","tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z","tBodyGyro-mean()-X","tBodyGyro-mean()-Y","tBodyGyro-mean()-Z","tBodyGyro-std()-X","tBodyGyro-std()-Y", "tBodyGyro-std()-Z","tBodyGyroJerk-mean()-X","tBodyGyroJerk-mean()-Y","tBodyGyroJerk-mean()-Z","tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-Z","tBodyAccMag-mean()"
,"tBodyAccMag-std()","tGravityAccMag-mean()","tGravityAccMag-std()"
,"tBodyAccJerkMag-mean()","tBodyAccJerkMag-std()","tBodyGyroMag-mean()","tBodyGyroMag-std()", "tBodyGyroJerkMag-mean()","tBodyGyroJerkMag-std()","fBodyAcc-mean()-X","fBodyAcc-mean()-Y","fBodyAcc-mean()-Z","fBodyAcc-std()-X","fBodyAcc-std()-Y"
,"fBodyAcc-std()-Z","fBodyAccJerk-mean()-X","fBodyAccJerk-mean()-Y"
,"fBodyAccJerk-mean()-Z","fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y","fBodyAccJerk-std()-Z","fBodyGyro-mean()-X", "fBodyGyro-mean()-Y"
,"fBodyGyro-mean()-Z","fBodyGyro-std()-X", "fBodyGyro-std()-Y"
,"fBodyGyro-std()-Z","fBodyAccMag-mean()","fBodyAccMag-std()","fBodyBodyAccJerkMag-mean()","fBodyBodyAccJerkMag-std()","fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-std()","fBodyBodyGyroJerkMag-mean()","fBodyBodyGyroJerkMag-std()")
colname<-c("LAYING", "SITTING ","STANDING", "WALKING", "WALKING_DOWNSTAIRS"," WALKING_UPSTAIRS",seq(1,30,by=1))

new.data<-cbind(new.dt,new2.dt)
dimnames(new.data)<-list(rownames,colname)
names(new.data)

##======================================================
tidy.data.1<-select.dt
tidy.data.2<-t(new.data)

write.table(tidy.data.2, file="TidyData.txt",row.name=FALSE)  














