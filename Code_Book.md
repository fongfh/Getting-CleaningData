Variables used in TRAIN, TEST and TIDY Data Sets
==========================================

The User whom the data is collected is identified by a number from 1 to 30. There are a totla of 30 users in the data 
sets. User identification is stored in variable **Subject_ID**. Each user perfoms 6 tasks. The name of each task is stored in variable **Activity**.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals **tAcc-XYZ** and tGyro-XYZ**. These time domain signals **(prefix 't' to denote time)** were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (**tBodyAcc-XYZ** and **tGravityAcc-XYZ**) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (**tBodyAccJerk-XYZ** and **tBodyGyroJerk-XYZ**). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (**tBodyAccMag**, **tGravityAccMag**, **tBodyAccJerkMag**, **tBodyGyroMag**, **tBodyGyroJerkMag**).
 
The frequency domain of the above signals are **fBodyAcc-XYZ**, **fBodyAccJerk-XYZ**, **fBodyGyro-XYZ**, **fBodyAccJerkMag**, **fBodyGyroMag**, **fBodyGyroJerkMag**. (Note the **'f' to indicate frequency domain signals**). 

These signals were used to estimate variables of the feature vector for each pattern:  
'**-XYZ**' is used to denote 3-axial signals in the X, Y and Z directions.

1. **tBodyAcc-XYZ**
2. **tGravityAcc-XYZ**
3. **tBodyAccJerk-XYZ**    
4. **tBodyGyro-XYZ**
5. **tBodyGyroJerk-XYZ**
6. **tBodyAccMag**
7. **tGravityAccMag**
8. **tBodyAccJerkMag**
9. **tBodyGyroMag**
10. **tBodyGyroJerkMag**
11. **fBodyAcc-XYZ**
12. **fBodyAccJerk-XYZ**
13. **fBodyGyro-XYZ**
14. **fBodyAccMag**
15. **fBodyAccJerkMag**
16. **fBodyGyroMag**
17. **fBodyGyroJerkMag**

The set of variables that were estimated from the above signals are: 

1. **mean()**: Mean value
2. **std()**: Standard deviation
3. **mad()**: Median absolute deviation 
4. **max()**: Largest value in array
5. **min()**: Smallest value in array
6. **sma()**: Signal magnitude area
7. **energy()**: Energy measure. Sum of the squares divided by the number of values. 
8. **iqr()**: Interquartile range 
9. **entropy()**: Signal entropy
10. **arCoeff()**: Autorregresion coefficients with Burg order equal to 4
11. **correlation()**: correlation coefficient between two signals
12. **maxInds()**: index of the frequency component with largest magnitude
13. **meanFreq()**: Weighted average of the frequency components to obtain a mean frequency
14. **skewness()**: skewness of the frequency domain signal 
15. **kurtosis()**: kurtosis of the frequency domain signal 
16. **bandsEnergy()**: Energy of a frequency interval within the 64 bins of the FFT of each window.
17. **angle()**: Angle between to vectors.


NOTE on the final TIDY data set variables
-----------------------------------------
 
In the final **TIDY** data set (file: 'final_data.txt' or, data frame: 'final_data') , only variables that match **'mean()'** and **'std()'** exactly are selected to be in the final **TIDY** data. 

It neans that variables that do NOT match exactly will be left out, like variables with 'meanFreq()' or 'tBodyAccJerkMean' as these are strictly not mathematically computed mean or standard deviation values.     


