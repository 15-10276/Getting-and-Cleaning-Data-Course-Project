# CodeBook - Tidy Data  

This is a part of a data set that recompiled the results of *“experiments \[that\] have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING,
WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its
embedded accelerometer and gyroscope, we captured 3-axial linear
acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually. The
obtained dataset has been randomly partitioned into two sets, where 70%
of the volunteers was selected for generating the training data and 30%
the test data.”* 

This new set has 11,880 rows and 4 columns which only has the estimaded values of Mean and Standard deviation for each originally selected feature. 
Now, I'm going to explain the variables in there. 


* «variable»

  Factor with 66 levels
  
  The feature that has been measured in the experiments. The authors explained *"The features selected for this database come from the accelerometer and gyroscope 3-axial raw         signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter     and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity           acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration     and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were               calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some     of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).     These signals were used to estimate variables of the feature vector for each pattern:'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."* 
  
  Its values are:
  
  "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
  "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
  "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
 "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
 "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
 "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
 "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
 "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
 "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
 "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
 "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
 "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
 "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
 "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
 "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
 "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
 "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
 "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
 "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
 "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
 "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
 "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
 "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
 "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
 "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
 "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
 "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
 "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
 "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
 "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
 "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"  
 "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
 "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"

* «subject»

  int 

  This vector contains the identification of every subject who has participated in the experiments. The way they are identified is by a number, from 1 to 30.
  
* «activityname»

  chr
  
  This is a character vector which contains the labels of the activity performed during the experimentaions. There are just six kind of activities, and those are:
  WALKING
  
  WALKING_UPSTAIRS
  
  WALKING_DOWNSTAIRS
  
  SITTING
  
  STANDING
  
  LAYING
  
  
* «average»

  num 
  
  This is a num vector which contains, the values of each features, normalized and bounded within [-1,1]
  
  
1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
