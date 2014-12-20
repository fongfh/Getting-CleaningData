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

How to use the 'run_analysis.R' script:
---------------------------------------





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
 
| No | Variable Name       |Variable Name       |Variable Name       |Variable Name      |Variable Name      |
|----|---------------------|--------------------|--------------------|-------------------|-------------------|           
|  1 | "tBodyAcc-mean()-X" |"tBodyAcc-mean()-Y" |"tBodyAcc-mean()-Z" |"tBodyAcc-std()-X" |"tBodyAcc-std()-Y" |
|  6 | "tBodyAcc-std()-Z"  |"tGravityAcc-mean()-X" |"tGravityAcc-mean()-Y" |"tGravityAcc-mean()-Z" |"tGravityAcc-std()-X" |     
| 11 | "tGravityAcc-std()-Y" |"tGravityAcc-std()-Z" |"tBodyAccJerk-mean()-X" |"tBodyAccJerk-mean()-Y" |"tBodyAccJerk-mean()-Z" |       
| 16 | "tBodyAccJerk-std()-X" |"tBodyAccJerk-std()-Y" |"tBodyAccJerk-std()-Z" |"tBodyGyro-mean()-X" |"tBodyGyro-mean()-Y" |          
| 21 | "tBodyGyro-mean()-Z" |"tBodyGyro-std()-X" |"tBodyGyro-std()-Y" |"tBodyGyro-std()-Z" |"tBodyGyroJerk-mean()-X" |    
| 26 | "tBodyGyroJerk-mean()-Y" |"tBodyGyroJerk-mean()-Z" |"tBodyGyroJerk-std()-X" |"tBodyGyroJerk-std()-Y" |"tBodyGyroJerk-std()-Z" |       
| 31 | "tBodyAccMag-mean()" |"tBodyAccMag-std()" |"tGravityAccMag-mean()" |"tGravityAccMag-std()" |"tBodyAccJerkMag-mean()" |     
| 36 | "tBodyAccJerkMag-std()" |"tBodyGyroMag-mean()" |"tBodyGyroMag-std()" |"tBodyGyroJerkMag-mean()" |"tBodyGyroJerkMag-std()" |     
| 41 | "fBodyAcc-mean()-X" |"fBodyAcc-mean()-Y" |"fBodyAcc-mean()-Z" |"fBodyAcc-std()-X" |"fBodyAcc-std()-Y" |           
| 46 | "fBodyAcc-std()-Z" |"fBodyAccJerk-mean()-X" |"fBodyAccJerk-mean()-Y" |"fBodyAccJerk-mean()-Z" |"fBodyAccJerk-std()-X" |        
| 51 | "fBodyAccJerk-std()-Y" |"fBodyAccJerk-std()-Z" |"fBodyGyro-mean()-X" |"fBodyGyro-mean()-Y" |"fBodyGyro-mean()-Z" |        
| 56 | "fBodyGyro-std()-X" |"fBodyGyro-std()-Y" |"fBodyGyro-std()-Z" |"fBodyAccMag-mean()" |"fBodyAccMag-std()" |          
| 61 | "fBodyBodyAccJerkMag-mean()" |"fBodyBodyAccJerkMag-std()" |"fBodyBodyGyroMag-mean()" |"fBodyBodyGyroMag-std()" |"fBodyBodyGyroJerkMag-mean()" |
| 66 | "fBodyBodyGyroJerkMag-std()" |    |    |    |    |


A sample of the first 20 rows of the final tidy dataframe is shown below. Due to space constraints, only the first 7 columns of the dataframe are listed.
 
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
|            2|       LAYING|         0.2813734|      -0.018158740|       -0.10724561|      -0.97405946|     -0.980277399|
|            3|      WALKING|         0.2755675|      -0.017176784|       -0.11267486|      -0.36035673|     -0.069914065|
|            3| WALK_UPSTAIR|         0.2608199|      -0.032410941|       -0.11006486|      -0.31312344|      0.011628081|
|            3| WALK_DNSTAIR|         0.2924235|      -0.019355408|       -0.11613984|      -0.05741005|     -0.033150372|
|            3|      SITTING|         0.2571976|      -0.003502998|       -0.09835792|      -0.97101012|     -0.856617812|
|            3|     STANDING|         0.2800465|      -0.014337656|       -0.10162172|      -0.96674254|     -0.893449307|
|            3|       LAYING|         0.2755169|      -0.018955679|       -0.10130048|      -0.98277664|     -0.962057545|
|            4|      WALKING|         0.2785820|      -0.014839948|       -0.11140306|      -0.44082997|     -0.078826737|
|            4| WALK_UPSTAIR|         0.2708767|      -0.031980430|       -0.11421946|      -0.20493304|     -0.066689911|
