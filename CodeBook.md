#Code Book for Getting and Cleaning Data Course Project

##Data Source

The data source for the project can be retrieved from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###Input data files
The run_analysis.R file will get and clean data from the following files:
1.  X_test.txt
2.  y_test.txt
3.  subject_test.txt
4.  X_train.txt
5.  y_train.txt
6.  subject_train.txt

##Cleaning Data Process
1.  Extract only mean and std measurements from features.txt file.
2.  Extract columns in X_text.txt and X_train.txt that are only associated with mean and std measurements.
3.  Use descriptive activity names to name the activities in y_test.txt and y_train.txt files based on the activity labels
    included in the activity_labels.txt file.
4.  Label the data set with Subject as the variable names in the subject_test.txt and subject_train.txt files.
5.  Merge all thes files together.
6.  Prepare a tidy data set with the average of each variable for each activity and each subject.

##Output columns
[1] "Subject"                     "ActivityDesc"                "tBodyAcc-mean()-X"          
[4] "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
[7] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"            "tGravityAcc-mean()-X"       
[10] "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
[13] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"         "tBodyAccJerk-mean()-X"      
[16] "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
[19] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"        "tBodyGyro-mean()-X"         
[22] "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
[25] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"           "tBodyGyroJerk-mean()-X"     
[28] "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
[31] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"       "tBodyAccMag-mean()"         
[34] "tBodyAccMag-std()"           "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
[37] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"       "tBodyGyroMag-mean()"        
[40] "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
[43] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"          
[46] "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
[49] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"      
[52] "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
[55] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"         
[58] "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
[61] "fBodyAccMag-mean()"          "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-mean()" 
[64] "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
[67] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 

##Output file
The tidy data will be written to the tidy.txt file. 

##More information
Please refer to other files, README.md and run_Analysis.R files for more information.
