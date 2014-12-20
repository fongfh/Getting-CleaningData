Getting and Cleaning Data Project
=================================

Data Preparation
----------------

The purpose of this project is to practise on two data sets: train and test. The final outcome is a tidy dataset with the following preparations:

A R script called 'run_analysis.R' reads in the data files and processes the data. It does the following:

   * Merges the training and the test sets to create one data set.
   * Extracts only the measurements on the mean and standard deviation for each measurement. 
   * Uses descriptive activity names to name the activities in the data set
   * Appropriately labels the data set with descriptive variable names. 
   * Creates a new, independent tidy data set with the average of each variable for each activity and each subject.

Notes on the R Script
---------------------

  1. The script function assumes the working directory is ~/.../UCI HAR Dataset/.   
  2. It reads in TRAIN data sets into dataframes: x_train, y_train, s_train & combines into bigger dataframe: syx_train. 
  3. It reads in TEST data sets into dataframes: x_test, y_test, s_test & combines into bigger dataframe: syx_test.
  4. It merges TRAIN & TEST dataframes is stored in syx_combined.
  5. Subset of syx_combined with only 'mean' & 'std' is stored in dataframe syx_combined1.                  6. The final clean data file is store in dataframe 'final_data' & written to "final_data.txt" (stored in working directory).   


Output from the 'run_analysis.R' script:
----------------------------------------

The following **mean()** and **std()** columns that made up the tidy data frame. There are a total of **66** mean/std variables.
 
  1. "Subject_ID"                  
  2. "Activity"                    
  3. "tBodyAcc-mean()-X"          
  4. "tBodyAcc-mean()-Y"           
  5. "tBodyAcc-mean()-Z"           
  6. "tBodyAcc-std()-X" 
  7. "tBodyAcc-std()-Y"            
  8. "tBodyAcc-std()-Z"            
  9. "tGravityAcc-mean()-X"       
  10. "tGravityAcc-mean()-Y"        
  11. "tGravityAcc-mean()-Z"        
  12. "tGravityAcc-std()-X"        
  13. "tGravityAcc-std()-Y"         
  14. "tGravityAcc-std()-Z"         
  15. "tBodyAccJerk-mean()-X"      
  16. "tBodyAccJerk-mean()-Y"       
  17. "tBodyAccJerk-mean()-Z"       
  18. "tBodyAccJerk-std()-X"       
  19. "tBodyAccJerk-std()-Y"        
  20. "tBodyAccJerk-std()-Z"        
  21. "tBodyGyro-mean()-X"         
  22. "tBodyGyro-mean()-Y"          
  23. "tBodyGyro-mean()-Z"          
  24. "tBodyGyro-std()-X"          
  25. "tBodyGyro-std()-Y"           
  26. "tBodyGyro-std()-Z"           
  27. "tBodyGyroJerk-mean()-X"     
  28. "tBodyGyroJerk-mean()-Y"      
  29. "tBodyGyroJerk-mean()-Z"      
  30. "tBodyGyroJerk-std()-X"      
  31. "tBodyGyroJerk-std()-Y"       
  32. "tBodyGyroJerk-std()-Z"       "tBodyAccMag-mean()"         
[34] "tBodyAccMag-std()"           "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
[37] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"       "tBodyGyroMag-mean()"        
[40] "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
[43] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"          
[46] "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
[49] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"      
[52] "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
[55] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"         
[58] "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
[61] "fBodyAccMag-mean()"          "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-mean()" 
[64] "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
[67] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 


A sample of the first 20 rows of the final tidy dataframe is shown below. Due to space constraints, only the first 10 columns of the dataframe are listed.
 
 |   Subject_ID|     Activity| tBodyAcc-mean()-X| tBodyAcc-mean()-Y| tBodyAcc-mean()-Z| tBodyAcc-std()-X| tBodyAcc-std()-Y|
 |-------------|-------------|------------------|------------------|------------------|-----------------|-----------------|
 |            1|      WALKING|         0.2773308|      -0.017383819|       -0.11114810|      -0.28374026|      0.114461337|
 |            1| WALK_UPSTAIR|         0.2554617|      -0.023953149|       -0.09730200|      -0.35470803|     -0.002320265|
 |            1| WALK_DNSTAIR|         0.2891883|      -0.009918505|       -0.10756619|       0.03003534|     -0.031935943|
 |            1|      SITTING|         0.2612376|      -0.001308288|       -0.10454418|      -0.97722901|     -0.922618642|
 |            1|     STANDING|         0.2789176|      -0.016137590|       -0.11060182|      -0.99575990|     -0.973190056|
 |            1|       LAYING|         0.2215982|      -0.040513953|       -0.11320355|      -0.92805647|     -0.836827406|
 |            2|      WALKING|         0.2764266|      -0.018594920|       -0.10550036|      -0.42364284|     -0.078091253|
 |            2| WALK_UPSTAIR|         0.2471648|      -0.021412113|       -0.15251390|      -0.30437641|      0.108027280|
 |            2| WALK_DNSTAIR|         0.2776153|      -0.022661416|       -0.11681294|       0.04636668|      0.262881789|
 |            2|      SITTING|         0.2770874|      -0.015687994|       -0.10921827|      -0.98682228|     -0.950704499|
 |            2|     STANDING|         0.2779115|      -0.018420827|       -0.10590854|      -0.98727189|     -0.957304989|
 12          2       LAYING         0.2813734      -0.018158740       -0.10724561      -0.97405946     -0.980277399
 13          3      WALKING         0.2755675      -0.017176784       -0.11267486      -0.36035673     -0.069914065
 14          3 WALK_UPSTAIR         0.2608199      -0.032410941       -0.11006486      -0.31312344      0.011628081
 15          3 WALK_DNSTAIR         0.2924235      -0.019355408       -0.11613984      -0.05741005     -0.033150372
 16          3      SITTING         0.2571976      -0.003502998       -0.09835792      -0.97101012     -0.856617812
 17          3     STANDING         0.2800465      -0.014337656       -0.10162172      -0.96674254     -0.893449307
 18          3       LAYING         0.2755169      -0.018955679       -0.10130048      -0.98277664     -0.962057545
 19          4      WALKING         0.2785820      -0.014839948       -0.11140306      -0.44082997     -0.078826737
 20          4 WALK_UPSTAIR         0.2708767      -0.031980430       -0.11421946      -0.20493304     -0.066689911
