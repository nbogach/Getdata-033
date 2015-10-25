## Getting and Cleaning Data Course

### Course Project

This repository contains files of course project.
Files are describes as follows:  
**README.md** - this documents  
**run_analysis.R** - script that perform getting and cleaning data.   
**tidy_data_set.txt** - output results of script  
**CodeBook.md** - description of data, stored in previous file

Notes: 
======
**run_analysis.R** load data provided by the project "Human Activity Recognition Using Smartphones Dataset"  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
  
Then followin manipulations with data commited:   
1. Merges the training and the test sets to create one data set (tdata).  
2. Extracts only the measurements on the mean and standard deviation for each measurement.   
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive variable names (from file features.txt). 
5. From the data set in step 4, creates a second, independent tidy data set (fdata) with the average of each variable for each activity and each subject.  
  