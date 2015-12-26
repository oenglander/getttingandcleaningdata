####Codebook.md designed to accompany README.md and run_analysis.R

######The data used for this project come from the *Human Activity Recognition Using Smartphones Data Set* available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
######The data represent the "recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone (Samsung Galaxy S II) with embedded inertial sensors". 
######More specifically, the data capture various measured variables (see Variables section) for six activities (walking, sitting, standing, etc) performed by each of the 30 participants (subjects). 

####Variables:
######Displaying only 66 mean and std variables required for final data set 
######Some notes regarding variables (per features_info.txt):
- X, Y, and Z are used to denote 3-axial signals in the X, Y and Z directions
- accelerometer (acc) and gyroscope (gyro)signals data were collected
- acceleration signal was separated into body and gravity acceleration signals
- body linear acceleration and angular velocity were derived in time to obtain Jerk signals
- Fast Fourier Transform (FFT) was applied to produce frequency domain signals
- Mag = magnitude


- time BodyAcc-mean -X (time domain)
- time BodyAcc-mean -Y (time domain)
- time BodyAcc-mean -Z (time domain)
- time BodyAcc-std -X (time domain)
- time BodyAcc-std -Y (time domain)
- time BodyAcc-std -Z (time domain)
- time GravityAcc-mean()-X (time domain)
- time GravityAcc-mean()-Y (time domain)
- time GravityAcc-mean()-Z (time domain)
- time GravityAcc-std()-X (time domain)
- time GravityAcc-std()-Y (time domain)
- time GravityAcc-std()-Z (time domain)
- time BodyAccJerk-mean()-X (time domain)
- time BodyAccJerk-mean()-Y (time domain)
- time BodyAccJerk-mean()-Z (time domain)
- time BodyAccJerk-std()-X (time domain)
- time BodyAccJerk-std()-Y (time domain)
- time BodyAccJerk-std()-Z (time domain)
- time BodyGyro-mean()-X (time domain)
- time BodyGyro-mean()-Y (time domain)
- time BodyGyro-mean()-Z (time domain)
- time BodyGyro-std()-X (time domain)
- time BodyGyro-std()-Y (time domain)
- time BodyGyro-std()-Z (time domain)
- time BodyGyroJerk-mean()-X (time domain)
- time BodyGyroJerk-mean()-Y (time domain)
- time BodyGyroJerk-mean()-Z (time domain)
- time BodyGyroJerk-std()-X (time domain)
- time BodyGyroJerk-std()-Y (time domain)
- time BodyGyroJerk-std()-Z (time domain)
- time BodyAccMag-mean() (time domain)
- time BodyAccMag-std() (time domain)
- time GravityAccMag-mean() (time domain)
- time GravityAccMag-std() (time domain)
- time BodyAccJerkMag-mean() (time domain)
- time BodyAccJerkMag-std() (time domain)
- time BodyGyroMag-mean() (time domain)
- time BodyGyroMag-std() (time domain)
- time BodyGyroJerkMag-mean() (time domain)
- time BodyGyroJerkMag-std() (time domain)
- frequency BodyAcc-mean()-X (frequency domain)
- frequency BodyAcc-mean()-Y (frequency domain)
- frequency BodyAcc-mean()-Z (frequency domain)
- frequency BodyAcc-std()-X (frequency domain)
- frequency BodyAcc-std()-Y (frequency domain)
- frequency BodyAcc-std()-Z (frequency domain)
- frequency BodyAccJerk-mean()-X (frequency domain)
- frequency BodyAccJerk-mean()-Y (frequency domain)
- frequency BodyAccJerk-mean()-Z (frequency domain)
- frequency BodyAccJerk-std()-X (frequency domain)
- frequency BodyAccJerk-std()-Y (frequency domain)
- frequency BodyAccJerk-std()-Z (frequency domain)
- frequency BodyGyro-mean()-X (frequency domain)
- frequency BodyGyro-mean()-Y (frequency domain)
- frequency BodyGyro-mean()-Z (frequency domain)
- frequency BodyGyro-std()-X (frequency domain)
- frequency BodyGyro-std()-Y (frequency domain)
- frequency BodyGyro-std()-Z (frequency domain)
- frequency BodyAccMag-mean() (frequency domain)
- frequency BodyAccMag-std() (frequency domain)
- frequency BodyBodyAccJerkMag-mean() (frequency domain)
- frequency BodyBodyAccJerkMag-std() (frequency domain)
- frequency BodyBodyGyroMag-mean() (frequency domain)
- frequency BodyBodyGyroMag-std() (frequency domain)
- frequency BodyBodyGyroJerkMag-mean() (frequency domain)
- frequency BodyBodyGyroJerkMag-std() (frequency domain)


####Data:
######The data sets were randomly divided into two sets, where 70% of the subjects generate the training data and 30% the test data.  Please note below, the *train* or *test* designation for each of the first six data sets listed below.
- 'X_train.txt': Training set of measured data (561 measured variables w/ no column headings/variable names).
- 'y_train.txt': Training labels (1,2,3,4,5,6).
- 'X_test.txt': Test set of measured data (561 measured variables w/ no column headings/variable names).
- 'y_test.txt': Test labels (1,2,3,4,5,6).
- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 (30 subjects in total). 
- 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 (30 subjects in total). 
- 'features.txt': Includes a list of all measured variables in X_train and X_test.
- 'activity_labels.txt': Links the labels in y_train and y_test (1,2,3,4,5,6) with their descriptive activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), where 1 == WALKING, 2 == WALKING_UPSTAIRS, etc.

######Additional data available but not used in this analysis (from Human Activity Recognition Using Smartphones Dataset README file):
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 



####Steps performed to clean up the data:
1. Merge the training and the test sets to create one data set 
      - using rbind to merge rows of train and test data sets 
      - checking dimensions all along to ensure merge is done correctly
2. Extract only the measurements on the mean and standard deviation for each measurement
      - using grep to search for matches to specified arguments (mean and std) in column 2 of features.txt
      - sixty six (66) relevant measurement columns remain following grep operation 
      - cleaning up/editing labels to provide descriptive variable names
3. Place descriptive activity names to name the activities in the data set 
      - activity_labels.txt contains descriptive activity names (6 levels including walking, sitting, standing) that are matched up with numerical values/labels in y dataset
4. Label the data set with descriptive variable names 
      - forming the complete dataset using cbind of the three merged datasets w/ descriptive variable names (as completed in step 2)
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject 
      - using melt operation followed by dcast operation on the complete dataset to yield a dataset with the average of each variable for each activity and each subject
      - using melt results in a dataset with 4 columns (Subject, Activity, variable, value)
      - next, using dcast it is possible to calculate the average (mean) for each activity and each subject
      - the final dataset contains 180 rows or observations (30 subjects * 6 activities) and 68 columns (Subject, Activity, mean of 66 measured variables)
      - using write.table to write dataset to .txt file
