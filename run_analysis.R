
## Load necessary packages
library(dplyr)
library(tidyr)

## Preparations

        ## Set the path do source data
        path2data <- "C:/Users/Abelardo/Downloads/Coursera/Data Science Specification/Getting and Cleaning Data/Course project/UCI HAR Dataset/" 

        ## Clear console 
        cat("\014")


## Read training data
        file2load <- paste(path2data,"train/x_train.txt", sep="")
        mydf <- read.table(file2load)

## Load activities codes (train)
        file2load <- paste(path2data,"train/y_train.txt", sep="")
        activities <- read.table(file2load)
        names(activities)[1] <- "activity_code"

## Load subject codes (train)
        file2load <- paste(path2data,"train/subject_train.txt", sep="")
        subjects <- read.table(file2load)
        names(subjects)[1] <- "subject_code"

## Join all train data into one dataframe (dplyr). Also add column to save origin of data.
        train <- tbl_df(cbind(subjects, activities, mydf))
        train <- mutate(train, origin="train")

## Read test data
        file2load <- paste(path2data,"test/x_test.txt", sep="")
        mydf <- read.table(file2load)

## Load activities codes (test)
        file2load <- paste(path2data,"test/y_test.txt", sep="")
        activities <- read.table(file2load)
        names(activities)[1] <- "activity_code"

## Load subject codes (test)
        file2load <- paste(path2data,"test/subject_test.txt", sep="")
        subjects <- read.table(file2load)
        names(subjects)[1] <- "subject_code"

## Join all test data into one dataframe (dplyr). Also add column to save origin of data.
        test <- tbl_df(cbind(subjects, activities, mydf))
        test <- mutate(test, origin="test")

## Combine two datasets (train and test) into one 
                tdata <- tbl_df(bind_rows(train, test))

        ## Tyding. Step1 - Gather all observation and organize them in two column: feature_name and feature_value
                tdata <- gather(tdata, key = feature_name, feature_value, -subject_code, -activity_code, -origin)
        
        ## Tyding. Step2 - Rewrite feature_name with numeric values. It becomes a key to join with real feature names lately. 
                tdata <- mutate(tdata, feature_name = as.numeric(extract_numeric(feature_name)))


## Read features names
        file2load <- paste(path2data, "features.txt", sep="")
        features <- read.table(file2load, stringsAsFactors = FALSE)
        names(features) <- c("feature_name", "feature_fname")

## Read activities names
        file2load <- paste(path2data, "activity_labels.txt", sep="")
        nactivities <- read.table(file2load, stringsAsFactors = FALSE)
        names(nactivities) <- c("activity_code", "activity_name")

## Get rid of features starting with letter "a" - they does not meet requirement #3 (in course project instruction)
        features <- features[grepl("^[^a]+.*", features$feature_fname),]

## Select all features that has prefix "mean" or "std" according to requirement #3 (in course project instruction)
        features <- features[grepl("([Mm]ean)|([Ss]td)", features$feature_fname),]

## Add descriptive variables names.
        tdata<- merge(tdata, features, by = "feature_name")
        
## Add descriptive activities names
        tdata<- merge(tdata, nactivities, by = "activity_code")

## Select only necessary columns.
        tdata<- select(tdata, subject_code, activity_name, feature_fname, feature_value, origin)

## Calculating average of each variable for each activity and each subject
fdata <- tdata %>%
        group_by(subject_code, activity_name, feature_fname) %>%
        summarize(avg_value = mean(feature_value))

## Saving results according to requirements #5 (in course project instruction)
        write.table(fdata, paste(path2data, "tidy_data_set.txt", sep=""))


print("Script has finished its work.")