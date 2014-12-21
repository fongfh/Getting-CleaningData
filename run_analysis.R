################################################################################
###  function run_analysis()                                                 ###        
###                                                                          ###   
###  Notes:                                                                  ### 
###    1. function assumes working directory is ~/.../UCI HAR Dataset/.      ###
###    2. read in TRAIN data sets into dataframes: x_train, y_train, s_train ###
###         & combines into bigger dataframe: syx_train.                     ###
###    3. read in TEST data sets into dataframes: x_test, y_test, s_test     ###
###         & combines into bigger dataframe: syx_test                       ###
###    4. merged TRAIN & TEST dataframe is stored in syx_combined.           ###
###    5. subset of syx_combined with only 'mean' & 'std' are stored         ###
###         in dataframe syx_combined1.                                      ###
###    6. final clean data file is store in dataframe final_data &           ###
###         written to "final_data.txt" (stored in working directory).       ###
###                                                                          ###
################################################################################

run_analysis <- function(){
   cat (" Project: Data Collection & Cleaning","\n\n")
   library(dplyr)

   #############################################################################
   ####   Read in the TRAIN data set                                        ####
   #############################################################################      
   cat (" Reading X_train data (7352 obs X 561 col) .... ","\n")
   x_train <-read.table("./train/X_train.txt",header = FALSE,sep ="")

   cat (" Reading y_train data (7352 obs X 1 col) .... ","\n")
   y_train <-read.table("./train/y_train.txt",header = FALSE,sep ="")

   cat(" Reading subject_train data (7352 obs X 1 col; values 1-30) .... ","\n")
   s_train<-read.table("./train/subject_train.txt",header = FALSE,sep ="")

   cat(" Reading features data (561 obs X 2 col) .... ","\n")
   features <-read.table("features.txt",header = FALSE,sep ="")
   
   cat(" Combining dataframes to form syx_train (7352 obs X 563 col) ....","\n")
   xy_train <-cbind(y_train,x_train) # combine 2 dataframes
   syx_train <-cbind(s_train,xy_train)

   cat(" Replacing Column Names with Feature Names ....","\n\n")
   for (i in 1:561){
     names(syx_train)[i+2]<-c(as.character(features$V2[i]))
   }

   names(syx_train)[1]<-c("Subject_ID") # change heading to "subject id"
   names(syx_train)[2]<-c("Activity") # change heading to "Activity"
   
   ###########################################################################
   ####   Next read in the TEST data set                                  ####
   ########################################################################### 
   cat(" Reading X_test data (2947 obs X 561 col) ....","\n")
   x_test <-read.table("./test/X_test.txt",header = FALSE,sep ="") 

   cat(" Reading y_test data (2947 obs X 1 col) ....","\n")
   y_test <-read.table("./test/y_test.txt",header = FALSE,sep ="")

   cat(" Reading subject_test data (2947 obs X 1 col; values 1-30) ....","\n")
   s_test <-read.table("./test/subject_test.txt",header = FALSE,sep ="")

   cat(" Combining dataframes to form syx_test (2947 obs X 563 col) ....","\n")
   xy_test <-cbind(y_test,x_test) # combine 2 dataframes
   syx_test <-cbind(s_test,xy_test)

   cat(" Replacing Column Names with Feature Names ....","\n\n")
   for (i in 1:561){
     names(syx_test)[i+2]<-c(as.character(features$V2[i]))
   }

   names(syx_test)[1]<-c("Subject_ID") # change heading to "subject id"
   names(syx_test)[2]<-c("Activity") # change heading to "Activity"
   
   ###########################################################################
   ####   Combine the TRAIN and TEST datasets                             ####
   ########################################################################### 
   cat(" Append TRAIN & TEST dataframes to syx_combined (10299 obs X 563 col)","\n\n")
   syx_combined = rbind(syx_train,syx_test)

   ###########################################################################
   ####   Create a new dataframe for columns with                         ####
   ####   'mean()' or 'std()'.                                            ####
   ########################################################################### 
   cat(" Remove cols that are NOT 'mean()' or 'std()' .... ","\n")
   syx_combined1 = data.frame(matrix (ncol=0,nrow=10299)) # create an empty dataframe
   syx_combined1_colnames = c() # create an empty vector to hold the column names
   
   # copy the 1st column over
   syx_combined1 <- cbind(syx_combined1, syx_combined[,1])
   syx_combined1_colnames = c(syx_combined1_colnames,colnames(syx_combined)[1])
  
   # copy the 2nd column over
   syx_combined1 <- cbind(syx_combined1, syx_combined[,2])
   syx_combined1_colnames = c(syx_combined1_colnames,colnames(syx_combined)[2])

   #### now check and remove columns that are not 'mean()' or 'std()'   ####
   for (i in 3:563){
      if (grepl("mean()",colnames(syx_combined[i]),fixed=TRUE) | grepl("std()",colnames(syx_combined[i]),fixed=TRUE))
      {
          syx_combined1 <- cbind(syx_combined1, syx_combined[,i])
          syx_combined1_colnames = c(syx_combined1_colnames,colnames(syx_combined)[i])
     }
   colnames(syx_combined1)<- syx_combined1_colnames # write the column names back
   }

   ##########################################################################
   ####   Compute the summaries by User and Activity                     ####
   ##########################################################################
   cat(" Now computing summaries of by Subject_ID and Activity type. ......","\n")
   final_data <- syx_combined1 %>% group_by (Subject_ID, Activity) %>% summarise_each(funs(mean)) 

   ##########################################################################
   ####   Changing to Activity names:                                    ####
   ####   WALKING, WALK_UPSTAIR, WALK_DNSTAIR, SITTING, STANDING, LAYING ####
   ##########################################################################
   cat(" Now changing Activity type to be names: WALKING,WALK_UPSTAIR,WALK_DNSTAIR,SITTING,STANDING,LAYING","\n")
   activity=c("WALKING","WALK_UPSTAIR","WALK_DNSTAIR","SITTING","STANDING","LAYING")
   for (i in 1:180) {
        final_data$Activity1[i] <-activity[final_data$Activity[i]]
   }  
   final_data$Activity <- final_data$Activity1 # replace the original Activity column
   final_data$Activity1 <- NULL # remove Activity1 column after it is done

   cat(" Writing clean data to file 'final_data.txt' .........","\n\n")
   write.table (final_data, file="final_data.txt",row.name=FALSE,sep="\t")
   
   ##########################################################################
   ####   Return the final dataframe                                     ####
   ########################################################################## 
   cat (" Done!","\n\n")
   # cat(" Sample of final tidy dataframe .........","\n\n")
   # print(final_data[1:18,1:6]) # display a sample of 1st 18 rows of tidy data
   
   # return(final_data) # need not be in final code
}

