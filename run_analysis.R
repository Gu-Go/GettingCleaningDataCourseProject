## This file will (1) merge the training and the test sets to create one data set for the 
## data collected from the accelerometers from the Samsung Galaxy S smartphone
## Then, perform the following tasks:
## (2) Extracts only the measurements on the mean and standard deviation for each measurement. 
## (3) Uses descriptive activity names to name the activities in the data set
## (4) Appropriately labels the data set with descriptive variable names. 
## (5) From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.

if (!require("data.table")) {
        install.packages("data.table")
}

require("data.table")

## Data Source:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
## Unzip the file and load the Training and Test set files

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Dataset.zip")
unzip("Dataset.zip")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

## (2) Extract only mean and std measurements
measurements <- read.table("./UCI HAR Dataset/features.txt")[,2]
extract_measurements <- grepl("mean\\()|std", measurements)
names(X_test) = measurements
X_test = X_test[,extract_measurements]
names(X_train) = measurements
X_train = X_train[,extract_measurements]

## (3) Uses descriptive activity names to name the activities in the data set
act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
Y_test[,2] = act_labels[Y_test[,1]]
names(Y_test) = c("ActivityID", "ActivityDesc")
Y_train[,2] = act_labels[Y_train[,1]]
names(Y_train) = c("ActivityID", "ActivityDesc")

## (4) Appropriately labels the data set with descriptive variable names.
names(Sub_test) = "Subject"
names(Sub_train) = "Subject"

## (1) Merge the data
test_data <- cbind(as.data.table(Sub_test), Y_test, X_test)
training_data <- cbind(as.data.table(Sub_train), Y_train, X_train)
mergeData = rbind(test_data, training_data)

## (5) From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.
collabels <- c("Subject", "ActivityID", "ActivityDesc")
rowlabels = setdiff(colnames(mergeData), collabels)
meltData = melt(mergeData, id = collabels, measure.vars = rowlabels)
tidyData = dcast(meltData, Subject + ActivityDesc ~ variable, mean)
write.table(tidyData, file="tidy.txt", row.name=FALSE)
