######The data used for this project come from the *Human Activity Recognition Using Smartphones Data Set* available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
######The data represent the "recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone (Samsung Galaxy S II) with embedded inertial sensors". 
######More specifically, the data capture various measured variables (see Variables section) for six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) performed by each of the 30 participants (subjects). 

####Variables:




####Data:
######The data sets were randomly divided into two sets, where 70% of the subjects generate the training data and 30% the test data.  Please note below, the *train* or *test* designation for each of the first six data sets listed below.
- 'X_train.txt': Training set of measured data.
- 'y_train.txt': Training labels (1,2,3,4,5,6).
- 'X_test.txt': Test set of measured data.
- 'y_test.txt': Test labels (1,2,3,4,5,6).
- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 (30 subjects in total). 
- 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 (30 subjects in total). 
- 'features.txt': Includes a list of all measured variables in X_train and X_test.
- 'activity_labels.txt': Links the class labels (1,2,3,4,5,6) with their activity name (walking, sitting, standing, etc).
######Additional data available but not used in this analysis (from Human Activity Recognition Using Smartphones Dataset README file):
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 



####Steps performed to clean up the data:
1. Merge the training and the test sets to create one data set 
- using rbind to merge rows of train and test data sets 
- checking dimensions all along to ensure merge is done correctly
2. Extract only the measurements on the mean and standard deviation for each measurement - 
- using grep to search for matches to specified arguments (mean and std) in column 2 of features.txt
- 66 relevant measurement columns remain following grep operation 
- cleaning up/editing labels to provide descriptive variable names
3. Place descriptive activity names to name the activities in the data set 
- activity_labels.txt contains descriptive activity names (6 levels including walking, sitting, standing) that are matched up with numerical values/labels in y dataset
4. Label the data set with descriptive variable names 
- forming complete dataset using cbind of 3 merged datasets w/ descriptive variables names (as completed in step 2)
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject 
- using melt operation followed by dcast operation on complete dataset to yield dataset with average of each variable for each activity and each subject
- using melt results in a dataset with 4 columns (Subject, Activity, variable, value)
- next, using dcast to calculate the average for each activity and each subject
- final dataset contains 180 rows (30 subjects * 6 activities) and 68 columns (Subject, Activity, mean of 66 measured variables)