# Getting and Cleaning Data Project #

## Description ##
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.


## Data Source ##
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data used for this project are collected from the accelerometers from the Samsung Galaxy S smartphone. The full description of the data can be found in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data set is available in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Data Set Information ##
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## Data Processing Tasks ##
The run_analysis.R script performs the following tasks:

1. Download the files from the given URL.

2. Unzip the files to the respective directory.

3. Reading the training data files (X_train.txt, Y_train.txt and subject_train.txt) from the folder "./UCI HAR Dataset/train" and create data tables.

4. Reading the test data files (X_test.txt, Y_test.txt and subject_test.txt) from the folder "./UCI HAR Dataset/test" and create data tables.

5. Reading the features and activity labels data files (features.txt and activity_labels.txt) from the folder "./UCI HAR Dataset" and create data tables.
6. Merges the training and test data sets to create one data set.

7. Extracts only the measurement on the mean and standard deviation for each measurement.

8. Uses descriptive activity names to name the activities in the data set.

9. Appropriately labels the data set with descriptive variable names.

10. From the data set in step 9, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## About Variables ##
* x_Train_Data, y_Train_Data, subject_Train_Data, x_Test_Data, y_Test_Data, subject_Test_Data, features and activity_labels contain the data from the downloaded files.
* final_training_set contains data which is bind from all the training data set (x_Train_Data, y_Train_Data and subject_Train_Date) obtained from the downloaded files.
* final_test_set contains data which is bind from all the test data set (x_Test_Data, y_Test_Data and subject_Test_Date) obtained from the downloaded files.
* final_data_set binds all the data rows from the final_training_set and final_test_set
* final_data_set_colNames is a vector for column names from the final_data_set, which will be used to select the mean() and stddev() columns
* mean_and_std is a logical vector for defining activityID, subjectID, mean and standard deviation
* final_data_set contains the data set which fulfills the mean_and_std logical vector
* final_data_set_with_activity_names merges the final_data_set with the activity_labels data set so as to include descriptive activity names
* second_tidy_data_set is a tidy data set which contains the relevant average of each variable for each activity and each subject, which will be later stored in a .txt file.  