run_analysis<-function(){
  # check the diretory exist or not
  if(!file.exists("./R Scripts")){
    dir.create("./R scripts")
  }
  
  # download the files from the given url
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./R scripts/fullData.zip")
  
  # unzip the files to the R scripts directory
  unzip(zipfile = "./R scripts/fullData.zip", exdir = "./R scripts")
  
  # Reading training dataset
  x_Train_Data <- read.table("./R scripts/UCI HAR Dataset/train/X_train.txt")
  y_Train_Data <- read.table("./R scripts/UCI HAR Dataset/train/Y_train.txt")
  subject_Train_Data <- read.table("./R scripts/UCI HAR Dataset/train/subject_train.txt")  
  
  # Reading testing dataset
  x_Test_Data <- read.table("./R scripts/UCI HAR Dataset/test/X_test.txt")
  y_Test_Data <- read.table("./R scripts/UCI HAR Dataset/test/Y_test.txt")
  subject_Test_Data <- read.table("./R scripts/UCI HAR Dataset/test/subject_test.txt")
  
  # Reading feature lists
  features <- read.table("./R scripts/UCI HAR Dataset/features.txt")
  
  # Reading activity labels
  activity_labels <- read.table("./R scripts/UCI HAR Dataset/activity_labels.txt")
  
  # Assigning meaningful column names to the training datasets
  colnames(x_Train_Data) <- features[,2]
  colnames(y_Train_Data) <- "activityID"
  colnames(subject_Train_Data) <- "subjectID"
  
  # Assigning meaningful column names to the testing datasets
  colnames(x_Test_Data) <- features[,2]
  colnames(y_Test_Data) <- "activityID"
  colnames(subject_Test_Data) <- "subjectID"
  
  # Assigning meaningful column names to the activity labels dataset
  colnames(activity_labels)<-c("activityID","activityType")

  # Bind the y_Train_Data, subject_Train_data and x_Train_Data into the final training set
  final_training_set <- cbind(y_Train_Data,subject_Train_Data,x_Train_Data)
  
  # Bind the y_Test_Data, subject_Test_data and x_Test_Data into the final test set
  final_test_set <- cbind(y_Test_Data,subject_Test_Data,x_Test_Data)
  
  # Combine the final_training_set and final_test_set to create a final data set
  final_data_set <- rbind(final_training_set,final_test_set)
  
  # Create a vector for the column names from the final_data_set,
  # which will be used to select the mean() and stddev() columns
  final_data_set_colNames <- colnames(final_data_set)
  
  # Create a logical vector for defining activityID, subjectID, mean and standard deviation
  mean_and_std <- (grepl("activityID", final_data_set_colNames) | grepl("subjectID", final_data_set_colNames) | grepl("mean..", final_data_set_colNames) | grepl("std..", final_data_set_colNames))
  
  # Subsetting the final_data_set which fulfills the mean_and_std logical vector
  final_data_set <- final_data_set[,mean_and_std==TRUE]
  
  # merge the final data set with the activity_labels table to include descriptive activity names
  final_data_set_with_activity_names <- merge(final_data_set,activity_labels,by="activityID",all.x=TRUE)
  
  # creating a second, independent tidy data set with average of each variable for each activity and each subject
  second_tidy_data_set <- aggregate(. ~subjectID + activityID, final_data_set_with_activity_names,mean)
  second_tidy_data_set <- second_tidy_data_set[order(second_tidy_data_set$subjectID, second_tidy_data_set$activityID),]
  
  # write the second tidy set in text file
  write.table(second_tidy_data_set,"./R scripts/TidyDataSet.txt",row.names = FALSE)
}