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

