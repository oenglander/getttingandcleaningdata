# run_analysis.R
# need to setwd() to data directory
# need to load libraries: dplyr, tidyr, reshape, reshape2
library(dplyr)
library(tidyr)
#
#1 - Merge the training and the test sets to create one data set
#using rbind to merge rows of train and test data sets & checking dimensions all along to ensure merge is done correctly 
#X_train & X_test --> recorded data for a range of variables
XtrainData <- read.table("./train/X_train.txt")
dim(XtrainData)
#[1] 7352  561
XtestData <- read.table("./test/X_test.txt")
dim(XtestData)
#[1] 2947  561
joinXData <- rbind(XtrainData, XtestData)
dim(joinXData)
#[1] 10299   561 --> number of rows is the sum of X_train + X_test  
#y_train & y_test --> numerical representation for type of activity
ytrainData <- read.table("./train/y_train.txt")
dim(ytrainData)
#[1] 7352    1
ytestData <- read.table("./test/y_test.txt")
dim(ytestData)
#[1] 2947    1
joinyData <- rbind(ytrainData, ytestData)
dim(joinyData)
#[1] 10299     1 --> number of rows is the sum of y_train + y_test & matches X data 
#subject_train & subject_test --> 30 subjects participating in activities 
subjecttrain <- read.table("./train/subject_train.txt")
dim(subjecttrain)
#[1] 7352    1
subjecttest <- read.table("./test/subject_test.txt")
dim(subjecttest)
#[1] 2947    1
joinsubject <- rbind(subjecttrain, subjecttest)
dim(joinsubject)
#[1] 10299     1 --> number of rows is the sum of subject_train + subject_test
names(joinsubject) <- "Subject" #adding column heading
#
#2 - Extract only the measurements on the mean and standard deviation for each measurement
#features.txt contains column headings/named variables (in column 2) for X dataset
features <- read.table("./features.txt")
dim(features)
#[1] 561   2
#extract only mean and std features from column 2 of features; grep searches for matches to specified arguments 
meanORstd <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(meanORstd)
#[1] 66 --> only 66 mean and std variables
joinXData <- joinXData[, meanORstd]
dim(joinXData)
#[1] 10299    66 --> merged X data with extracted columns only
#clean up and make variable names clearer; gsub to replace multiple instances
names(joinXData) <- gsub("\\(\\)", "", features[meanORstd, 2])
names(joinXData) <- gsub("^t", "time", names(joinXData))
names(joinXData) <- gsub("^f", "frequency", names(joinXData))
names(joinXData) <- gsub("Mag", "Magnitude", names(joinXData))
#
#3 - Place descriptive activity names to name the activities in the data set
#activity_labels.txt contains descriptive activity names (6 levels inclding walking, sitting, standing) that match up with values in y dataset
activity_labels <- read.table("./activity_labels.txt")
activitylabel <- activity_labels[joinyData[, 1], 2]
joinyData[, 1] <- activitylabel  # replace numerical representation with descriptive names
names(joinyData) <- "Activity"  # adding column heading
#
#4 - Label the data set with descriptive variable names
#forming complete dataset using cbind of 3 merged datasets
#variables names were set in previous steps
complete_dataset <- cbind(joinsubject, joinyData, joinXData)
dim(complete_dataset)
#[1] 10299    68 --> 10299 rows as determined previously & 68 columns (Subject, Activity, 66 mean & std named variables)
#
#5 - Create an independent tidy data set with the average of each variable for each activity and each subject
library(reshape)
library(reshape2)
#using melt data to make dataset suitable for casting; specify id variables; measured variables are non id variables 
complete_dataset_melt <- melt(complete_dataset, id = c("Subject", "Activity"))
dim(complete_dataset_melt)
#[1] 679734      4 --> 4 columns: Subject, Activity, variable, value; 679734 rows: 10299 rows * 66 variables
#need average data for each variable by Subject & Activity (expect 180 rows (30 subjects * 6 activities))
#casting molten dataset using dcast
tidy_data <- dcast(complete_dataset_melt, Subject + Activity ~ variable, mean)
dim(tidy_data)
#[1] 180  68
write.table(tidy_data, file = "./tidy_data_final.txt", row.name = FALSE)


