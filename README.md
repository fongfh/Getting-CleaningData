PROJECT: Getting and Cleaning Data
==================================

Background to Project
---------------------

This project was part of the Coursera module 'Getting and Cleaning Data'.

The data sets used in this project are from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING, while wearing a smartphone (Samsung Galaxy S II) at the waist. Using the phone's embedded accelerometer and gyroscope, data on linear acceleration and 3-axial angular velocity were recorded at a constant rate of 50 times a second. 

The obtained dataset was categorised into a total of 561 variables and has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the **TRAIN** data set and 30% the **TEST** data set. 

Nature of Data
--------------

The features selected for the **TRAIN** and **TEST** data sets come from the **accelerometer** and **gyroscope** 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals **(prefix 't' to denote time)** were captured at a constant rate of 50 times per second. They were then filtered to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). 

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally some of the signals were transformed to the frequency domain producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. **(prefix 'f' to denote frequency)**. 

The signals (listed below) were used to estimate variables of the feature vector for each pattern where'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

1. tBodyAcc-XYZ
2. tGravityAcc-XYZ
3. tBodyAccJerk-XYZ
4. tBodyGyro-XYZ
5. tBodyGyroJerk-XYZ
6. tBodyAccMag
7. tGravityAccMag
8. tBodyAccJerkMag
9. tBodyGyroMag
10. tBodyGyroJerkMag
11. fBodyAcc-XYZ
12. fBodyAccJerk-XYZ
13. fBodyGyro-XYZ
14. fBodyAccMag
15. fBodyAccJerkMag
16. fBodyGyroMag
17. fBodyGyroJerkMag

The set of variables that were estimated from the above signals are: 

1. mean(): Mean value
2. std(): Standard deviation
3. mad(): Median absolute deviation 
4. max(): Largest value in array
5. min(): Smallest value in array
6. sma(): Signal magnitude area
7. energy(): Energy measure. Sum of the squares divided by the number of values. 
8. iqr(): Interquartile range 
9. entropy(): Signal entropy
10. arCoeff(): Autorregresion coefficients with Burg order equal to 4
11. correlation(): correlation coefficient between two signals
12. maxInds(): index of the frequency component with largest magnitude
13. meanFreq(): Weighted average of the frequency components to obtain a mean frequency
14. skewness(): skewness of the frequency domain signal 
15. kurtosis(): kurtosis of the frequency domain signal 
16. bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
17. angle(): Angle between to vectors.

Additional vectors were obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean


Data Preparation
----------------

The objective of this project is to extract and create a **TIDY** dataset with from the **TRAIN** and **TEST** data sets. 

The following are the data files available:

1. **'features.txt'**: Contains the list of all variables available. It has a total of 561 variables per each TRAIN or TEST data.
2. **'activity_labels.txt'**: Contains the labels for Activites (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and their associated label number used in the data sets. Label number range from 1 to 6 to denote each of the six activities.
3. **'X_train.txt'**: Contains the TRAIN data set. It consists of 7352 observations in 561 variables per observation.
4. **'y_train.txt'**: Contains the Activity labels (range from 1 to 6) for each record in the TRAIN data set. It consist of 7352 observations in one variable.
5. **'X_test.txt'**: Contains the TEST data set. It consists of 2947 observations in 561 variables per observation.
6. **'y_test.txt'**: Contains the Activity labels (range from 1 to 6) for each record in the TEST data set. It consist of 2947 observations in one variable.
7. **'subject_train.txt'**: Contains the Subject_ID data for each observation of the TRAIN data set. Each row identifies the subject (volunteer) who performed the activity for each window sample. Its range is from 1 to 30. 
8. **'subject_test.txt'**: Contains the Subject_ID data for each observation of the TEST data set. Each row identifies the subject (volunteer) who performed the activity for each window sample. Its range is from 1 to 30. 


A R script called **'run_analysis.R'** reads in the above data files and processes the data. It does the following:
   
1. The script function assumes the working directory is **~/.../UCI HAR Dataset/**.   
2. It reads in **TRAIN** data sets into dataframes: x_train (file: 'X_train.txt'), y_train (file: 'y_train.txt'), s_train (file: 'subject_train.txt') and combines the data frames into bigger dataframe: syx_train. 
3. It reads in **TEST** data sets into dataframes: x_test (file: 'X_test.txt'), y_test (file: 'y_test.txt'), s_test (file: 'subject_test.txt') and combines the data frames into bigger dataframe: syx_test. 
4. It merges **TRAIN** (syx_train) & **TEST** (syx_test) dataframes and stores the merged data frame to syx_combined.
5. A subset of syx_combined with only **'mean()'** and **'std()'** is stored in dataframe called syx_combined1. 
   - **NOTE:** Only variables that match **'mean()'** and **'std()'** exactly are selected to be in the final **TIDY** data. It neans that variables that do NOT match exactly will be left out, like variables with 'meanFreq()' or 'tBodyAccJerkMean' as these are strictly not mathematically computed mean or standard deviation values.           
6. The final clean data file is store in dataframe **'final_data'** & written to **"final_data.txt"** (stored in working directory).   
The resultant **TIDY** dataframe is stored in "final_data.txt" in the working directory. It consist of **180** observations in **68** variables, of which two are the categorical variables ("Subject_ID" and "Activity") and the rest are the variables related to **mean()** and **std()**.


Running the 'run_analysis.R' Script
-----------------------------------

From R command prompt, type the following:
 
    R Prompt> source("run_analysis.R") 
    R Prompt> run_analysis()
    Project: Data Collection & Cleaning 

    Reading X_train data (7352 obs X 561 col) ....  
    Reading y_train data (7352 obs X 1 col) ....  
    Reading subject_train data (7352 obs X 1 col; values 1-30) ....  
    Reading features data (561 obs X 2 col) ....  
    Combining dataframes to form syx_train (7352 obs X 563 col) .... 
    Replacing Column Names with Feature Names .... 

    Reading X_test data (2947 obs X 561 col) .... 
    Reading y_test data (2947 obs X 1 col) .... 
    Reading subject_test data (2947 obs X 1 col; values 1-30) .... 
    Combining dataframes to form syx_test (2947 obs X 563 col) .... 
    Replacing Column Names with Feature Names .... 

    Append TRAIN & TEST dataframes to syx_combined (10299 obs X 563 col) 

    Remove cols that are NOT 'mean()' or 'std()' ....  
    Now computing summaries of by Subject_ID and Activity type. ...... 
    Now changing Activity type to be names: WALKING,WALK_UPSTAIR,WALK_DNSTAIR,SITTING,STANDING,LAYING 
    Writing clean data to file 'final_data.txt' ......... 

    Done! 
    

Note that **run_analysis()** has no arguments. It writes the final **TIDY** data set to a file **"final_data.txt"** and stores it in the working directory.
 

Output from the 'run_analysis.R' Script
----------------------------------------

The following **mean()** and **std()** columns that made up the **TIDY** data frame. There are a total of **66 mean()** and **std()** variables with **180** observations (=30 'Subject_ID's each with 6 'Activites'). Note that only variables that matches exactly are included.
 
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



A sample of the first 20 observations of the final **TIDY** dataframe is shown below. It show the combined **TRAIN** and **TEST** data sorted by 'Subject_ID' and 'Activity'. 'Subject_ID' ranges from 1 to 30. 'Activity' is one of the following six: WALKING, WALK_UPSTAIR, WALK_DNSTAIR, SITTING, STANDING, LAYING. In the table, only the first seven columns of the data frame are shown.

 
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


Structure of TIDY Data Frame
----------------------------

The following is the structure of the final **TIDY** data frame ('final_data').  It consist of 180 observations (6 'Activity' per each of the 30 'Subject_ID') and has 68 variables in total.
 
    R Prompt> str(final_data)  
    Classes �grouped_df�, �tbl_df�, �tbl� and 'data.frame': 180 obs. of  68 variables:
      $ Subject_ID                 : int  1 1 1 1 1 1 2 2 2 2 ...
      $ Activity                   : chr  "WALKING" "WALK_UPSTAIR" "WALK_DNSTAIR" "SITTING" ...
      $ tBodyAcc-mean()-X          : num  0.277 0.255 0.289 0.261 0.279 ...
      $ tBodyAcc-mean()-Y          : num  -0.01738 -0.02395 -0.00992 -0.00131 -0.01614 ...
      $ tBodyAcc-mean()-Z          : num  -0.1111 -0.0973 -0.1076 -0.1045 -0.1106 ...
      $ tBodyAcc-std()-X           : num  -0.284 -0.355 0.03 -0.977 -0.996 ...
      $ tBodyAcc-std()-Y           : num  0.11446 -0.00232 -0.03194 -0.92262 -0.97319 ...
      $ tBodyAcc-std()-Z           : num  -0.26 -0.0195 -0.2304 -0.9396 -0.9798 ...
      $ tGravityAcc-mean()-X       : num  0.935 0.893 0.932 0.832 0.943 ...
      $ tGravityAcc-mean()-Y       : num  -0.282 -0.362 -0.267 0.204 -0.273 ...
      $ tGravityAcc-mean()-Z       : num  -0.0681 -0.0754 -0.0621 0.332 0.0135 ...
      $ tGravityAcc-std()-X        : num  -0.977 -0.956 -0.951 -0.968 -0.994 ...
      $ tGravityAcc-std()-Y        : num  -0.971 -0.953 -0.937 -0.936 -0.981 ...
      $ tGravityAcc-std()-Z        : num  -0.948 -0.912 -0.896 -0.949 -0.976 ...
      $ tBodyAccJerk-mean()-X      : num  0.074 0.1014 0.0542 0.0775 0.0754 ...
      $ tBodyAccJerk-mean()-Y      : num  0.028272 0.019486 0.02965 -0.000619 0.007976 ...
      $ tBodyAccJerk-mean()-Z      : num  -0.00417 -0.04556 -0.01097 -0.00337 -0.00369 ...
      $ tBodyAccJerk-std()-X       : num  -0.1136 -0.4468 -0.0123 -0.9864 -0.9946 ...
      $ tBodyAccJerk-std()-Y       : num  0.067 -0.378 -0.102 -0.981 -0.986 ...
      $ tBodyAccJerk-std()-Z       : num  -0.503 -0.707 -0.346 -0.988 -0.992 ...
      $ tBodyGyro-mean()-X         : num  -0.0418 0.0505 -0.0351 -0.0454 -0.024 ...
      $ tBodyGyro-mean()-Y         : num  -0.0695 -0.1662 -0.0909 -0.0919 -0.0594 ...
      $ tBodyGyro-mean()-Z         : num  0.0849 0.0584 0.0901 0.0629 0.0748 ...
      $ tBodyGyro-std()-X          : num  -0.474 -0.545 -0.458 -0.977 -0.987 ...
      $ tBodyGyro-std()-Y          : num  -0.05461 0.00411 -0.12635 -0.96647 -0.98773 ...
      $ tBodyGyro-std()-Z          : num  -0.344 -0.507 -0.125 -0.941 -0.981 ...
      $ tBodyGyroJerk-mean()-X     : num  -0.09 -0.1222 -0.074 -0.0937 -0.0996 ...
      $ tBodyGyroJerk-mean()-Y     : num  -0.0398 -0.0421 -0.044 -0.0402 -0.0441 ...
      $ tBodyGyroJerk-mean()-Z     : num  -0.0461 -0.0407 -0.027 -0.0467 -0.049 ...
      $ tBodyGyroJerk-std()-X      : num  -0.207 -0.615 -0.487 -0.992 -0.993 ...
      $ tBodyGyroJerk-std()-Y      : num  -0.304 -0.602 -0.239 -0.99 -0.995 ...
      $ tBodyGyroJerk-std()-Z      : num  -0.404 -0.606 -0.269 -0.988 -0.992 ...
      $ tBodyAccMag-mean()         : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...
      $ tBodyAccMag-std()          : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...
      $ tGravityAccMag-mean()      : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...
      $ tGravityAccMag-std()       : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...
      $ tBodyAccJerkMag-mean()     : num  -0.1414 -0.4665 -0.0894 -0.9874 -0.9924 ...
      $ tBodyAccJerkMag-std()      : num  -0.0745 -0.479 -0.0258 -0.9841 -0.9931 ...
      $ tBodyGyroMag-mean()        : num  -0.161 -0.1267 -0.0757 -0.9309 -0.9765 ...
      $ tBodyGyroMag-std()         : num  -0.187 -0.149 -0.226 -0.935 -0.979 ...
      $ tBodyGyroJerkMag-mean()    : num  -0.299 -0.595 -0.295 -0.992 -0.995 ...
      $ tBodyGyroJerkMag-std()     : num  -0.325 -0.649 -0.307 -0.988 -0.995 ...
      $ fBodyAcc-mean()-X          : num  -0.2028 -0.4043 0.0382 -0.9796 -0.9952 ...
      $ fBodyAcc-mean()-Y          : num  0.08971 -0.19098 0.00155 -0.94408 -0.97707 ...
      $ fBodyAcc-mean()-Z          : num  -0.332 -0.433 -0.226 -0.959 -0.985 ...
      $ fBodyAcc-std()-X           : num  -0.3191 -0.3374 0.0243 -0.9764 -0.996 ...
      $ fBodyAcc-std()-Y           : num  0.056 0.0218 -0.113 -0.9173 -0.9723 ...
      $ fBodyAcc-std()-Z           : num  -0.28 0.086 -0.298 -0.934 -0.978 ...
      $ fBodyAccJerk-mean()-X      : num  -0.1705 -0.4799 -0.0277 -0.9866 -0.9946 ...
      $ fBodyAccJerk-mean()-Y      : num  -0.0352 -0.4134 -0.1287 -0.9816 -0.9854 ...
      $ fBodyAccJerk-mean()-Z      : num  -0.469 -0.685 -0.288 -0.986 -0.991 ...
      $ fBodyAccJerk-std()-X       : num  -0.1336 -0.4619 -0.0863 -0.9875 -0.9951 ...
      $ fBodyAccJerk-std()-Y       : num  0.107 -0.382 -0.135 -0.983 -0.987 ...
      $ fBodyAccJerk-std()-Z       : num  -0.535 -0.726 -0.402 -0.988 -0.992 ...
      $ fBodyGyro-mean()-X         : num  -0.339 -0.493 -0.352 -0.976 -0.986 ...
      $ fBodyGyro-mean()-Y         : num  -0.1031 -0.3195 -0.0557 -0.9758 -0.989 ...
      $ fBodyGyro-mean()-Z         : num  -0.2559 -0.4536 -0.0319 -0.9513 -0.9808 ...
      $ fBodyGyro-std()-X          : num  -0.517 -0.566 -0.495 -0.978 -0.987 ...
      $ fBodyGyro-std()-Y          : num  -0.0335 0.1515 -0.1814 -0.9623 -0.9871 ...
      $ fBodyGyro-std()-Z          : num  -0.437 -0.572 -0.238 -0.944 -0.982 ...
      $ fBodyAccMag-mean()         : num  -0.1286 -0.3524 0.0966 -0.9478 -0.9854 ...
      $ fBodyAccMag-std()          : num  -0.398 -0.416 -0.187 -0.928 -0.982 ...
      $ fBodyBodyAccJerkMag-mean() : num  -0.0571 -0.4427 0.0262 -0.9853 -0.9925 ...
      $ fBodyBodyAccJerkMag-std()  : num  -0.103 -0.533 -0.104 -0.982 -0.993 ...
      $ fBodyBodyGyroMag-mean()    : num  -0.199 -0.326 -0.186 -0.958 -0.985 ...
      $ fBodyBodyGyroMag-std()     : num  -0.321 -0.183 -0.398 -0.932 -0.978 ...
      $ fBodyBodyGyroJerkMag-mean(): num  -0.319 -0.635 -0.282 -0.99 -0.995 ...
      $ fBodyBodyGyroJerkMag-std() : num  -0.382 -0.694 -0.392 -0.987 -0.995 ...
         - attr(*, "vars")=List of 1
         ..$ : symbol Subject_ID
         - attr(*, "drop")= logi TRUE

