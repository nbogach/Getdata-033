## CodeBook for Course Project  

#### Goal of the poject is to use data from "Human Activity Recognition Using Smartphones Dataset" to convert them into one tidy data set. As a result output file **tidy_data_set.txt** was created.
This file consists of the followind variables:
  
**subject_code** : int   
This variable presets code of subject who performed the activity for each window sample. Its range is from 1 to 30. 
    
**activity_name**: chr  
This variable presents activity performed by subject. It is possible six different activities:  
   WALKING  
   WALKING_UPSTAIRS  
   WALKING_DOWNSTAIRS  
   SITTING  
   STANDING  
   LAYING  
    
**feature_fname**: chr  
This character variable describes features that have been measured. Nature of feature could be derived from it's name:  
"fBodyAcc-mean()-X"   
"fBodyAcc-mean()-Y"   
"fBodyAcc-mean()-Z"   
"fBodyAcc-meanFreq()-X"   
...  
  
**avg_value**    : num   
Normalized average value of feature.

