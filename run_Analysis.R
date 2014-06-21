library(data.table)
# Read test and train data from text files
testingData <- read.table("test/X_test.txt",header=FALSE)
testData_activity <- read.table("test/y_test.txt",header=FALSE)
testData_subject <- read.table("test/subject_test.txt",header=FALSE)
trainingData <- read.table("train/X_train.txt",header=FALSE)
trainData_activity <- read.table("train/y_train.txt",header=FALSE)
trainData_subject <- read.table("train/subject_train.txt",header=FALSE)

# 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt",header=FALSE,colClasses="character")
testData_activity$V1 <- factor(testData_activity$V1,levels=activities$V1,labels=activities$V2)
trainData_activity$V1 <- factor(trainData_activity$V1,levels=activities$V1,labels=activities$V2)

# 4. label the data.frame with descriptive activity names from the file
features <- read.table("features.txt",header=FALSE,colClasses="character")
colnames(testingData)<-features$V2
colnames(trainingData)<-features$V2
colnames(testData_activity)<-c("Activity")
colnames(trainData_activity)<-c("Activity")
colnames(testData_subject)<-c("Subject")
colnames(trainData_subject)<-c("Subject")

# 1. Merge the test and training sets into one data.frame,
#(the activity names are associated prior merging; it is also possible to merge first and associate activites after merging)
testingData<-cbind(testingData,testData_activity)
testingData<-cbind(testingData,testData_subject)
trainingData<-cbind(trainingData,trainData_activity)
trainingData<-cbind(trainingData,trainData_subject)
finalData<-rbind(testingData,trainingData)

# 2. extract only the measurements on the mean and standard deviation for each measurement
finalData_mean<-sapply(finalData,mean,na.rm=TRUE)
finalData_sd<-sapply(finalData,sd,na.rm=TRUE)

# 5. Create an independent tidy data.table with the average of each variable for each activity and each subject.
Dat <- data.table(finalData)
tidy_table<-Dat[,lapply(.SD,mean),by="Activity,Subject"]

#Finally write the tidy dataset into a file
write.table(tidy_table,file="tidy_dataset.csv",sep=",",row.names = FALSE)