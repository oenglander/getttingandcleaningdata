####Getting and Cleaning Data Course Project

####Project Overview:

######The purpose of this project is to implement the concepts of *tidy data** to yield a tidy dataset.

######Per the project's guidelines, the following steps are executed using the code found in *run_analysis.R* :
1. Merge the training and the test sets to create one data set - *using rbind to merge rows of train and test data sets & checking dimensions all along to ensure merge is done correctly*
2. Extract only the measurements on the mean and standard deviation for each measurement - *using grep to search for matches to specified arguments (mean and std) in column 2 of features.txt; clean up/edit labels to provide descriptive variable names* 
3. Place descriptive activity names to name the activities in the data set - *activity_labels.txt contains descriptive activity names (6 levels inclding walking, sitting, standing) that match up with numerical values in y dataset*
4. Label the data set with descriptive variable names - *forming complete dataset using cbind of 3 merged datasets w/ descriptive variables names (step 2)*
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject - *using melt and dcast to yield desired dataset*

######The resulting tidy dataset contains 180 observations and 68 variables.

######To run run_analysis.R :

-Download the Human Activity Recognition Using Smartphones Dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

-Set R working directory using setwd() to directory where the data is located

-Load the following libraries: dplyr, tidyr, reshape, reshape2

######A code book (codebook.md) is included and describes the variables, the data, and steps performed to clean up the data.


######*https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html
######*http://vita.had.co.nz/papers/tidy-data.html
