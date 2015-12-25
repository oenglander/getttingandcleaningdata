#
# need to setwd() to data directory
# library(dplyr)
# library(tidy)
#
#1
XtrainData <- read.table("./train/X_train.txt")
dim(XtrainData)
XtestData <- read.table("./test/X_test.txt")
dim(XtestData)
joinXData <- rbind(XtrainData, XtestData)
dim(joinXData)
ytrainData <- read.table("./train/y_train.txt")
dim(ytrainData)
ytestData <- read.table("./test/y_test.txt")
dim(ytestData)
joinyData <- rbind(ytrainData, ytestData)
dim(joinyData)
subjecttrain <- read.table("./train/subject_train.txt")
dim(subjecttrain)
subjecttest <- read.table("./test/subject_test.txt")
dim(subjecttest)
joinsubject <- rbind(subjecttrain, subjecttest)
dim(joinsubject)
names(joinsubject) <- "Subject"
#
#2
features <- read.table("./features.txt")
dim(features)
meanORstd <- grep("mean\\(\\)|std\\(\\)", features[, 2])
##meanORstd <- grep("*mean*|*std*\\(\\)", features[, 2])
length(meanORstd)
joinXData <- joinXData[, meanORstd]
dim(joinXData)
names(joinXData) <- gsub("\\(\\)", "", features[meanORstd, 2])
names(joinXData) <- gsub("^t", "time", names(joinXData))
names(joinXData) <- gsub("^f", "frequency", names(joinXData))
names(joinXData) <- gsub("Mag", "Magnitude", names(joinXData))
#
#3
activity_labels <- read.table("./activity_labels.txt")
activitylabel <- activity_labels[joinyData[, 1], 2]
joinyData[, 1] <- activitylabel
names(joinyData) <- "Activity"
#
#4
complete_dataset <- cbind(joinsubject, joinyData, joinXData)
dim(complete_dataset)
#
#5
library(reshape)
library(reshape2)
complete_dataset_melt <- melt(complete_dataset, id = c("Subject", "Activity"))
dim(complete_dataset_melt)
tidy_data <- dcast(complete_dataset_melt, Subject + Activity ~ variable, mean)
dim(tidy_data)
write.table(tidy_data, file = "./tidy_data.txt")


