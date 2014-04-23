
Tidy Data Set Code Book	{#welcome}
====================


This is the CodeBook explaining the data set and the R script submitted for peer assessment in the course *Getting and Cleaning Data*, part of the online Data Science Specialization by the Johns Hopkins University.

> [learn more about the Data Science Specialization in Coursera](https://www.coursera.org/specialization/jhudatascience/1?utm_medium=listingPage "Data Science Specialization") 

----------
## The original data set

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The original set represents data built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.

You can [download the original data set here](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip) in a zip file.

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. The data set was randomly partitioned into two sets, 70% for the training data and 30% for the test data. These can be found in the test and train folder, respectively. They also have the same structure.

Additionaly, there are 561 variables that can be found in the *features.txt* file. This is a vector of features that was obtained by calculating variables from the time and frequency domain. For the purpose of this assignment, only variables that refer to the mean and standard deviation were taking into account, meaning that only 79 of those were used.

This is the variable list:

    tBodyAcc-mean()-X
    tBodyAcc-mean()-Y
    tBodyAcc-mean()-Z
    tBodyAcc-std()-X
    tBodyAcc-std()-Y
    tBodyAcc-std()-Z
    tGravityAcc-mean()-X
    tGravityAcc-mean()-Y
    tGravityAcc-mean()-Z
    tGravityAcc-std()-X
    tGravityAcc-std()-Y
    tGravityAcc-std()-Z
    tBodyAccJerk-mean()-X
    tBodyAccJerk-mean()-Y
    tBodyAccJerk-mean()-Z
    tBodyAccJerk-std()-X
    tBodyAccJerk-std()-Y
    tBodyAccJerk-std()-Z
    tBodyGyro-mean()-X
    tBodyGyro-mean()-Y
    tBodyGyro-mean()-Z
    tBodyGyro-std()-X
    tBodyGyro-std()-Y
    tBodyGyro-std()-Z
    tBodyGyroJerk-mean()-X
    tBodyGyroJerk-mean()-Y
    tBodyGyroJerk-mean()-Z
    tBodyGyroJerk-std()-X
    tBodyGyroJerk-std()-Y
    tBodyGyroJerk-std()-Z
    tBodyAccMag-mean()
    tBodyAccMag-std()
    tGravityAccMag-mean()
    tGravityAccMag-std()
    tBodyAccJerkMag-mean()
    tBodyAccJerkMag-std()
    tBodyGyroMag-mean()
    tBodyGyroMag-std()
    tBodyGyroJerkMag-mean()
    tBodyGyroJerkMag-std()
    fBodyAcc-mean()-X
    fBodyAcc-mean()-Y
    fBodyAcc-mean()-Z
    fBodyAcc-std()-X
    fBodyAcc-std()-Y
    fBodyAcc-std()-Z
    fBodyAcc-meanFreq()-X
    fBodyAcc-meanFreq()-Y
    fBodyAcc-meanFreq()-Z
    fBodyAccJerk-mean()-X
    fBodyAccJerk-mean()-Y
    fBodyAccJerk-mean()-Z
    fBodyAccJerk-std()-X
    fBodyAccJerk-std()-Y
    fBodyAccJerk-std()-Z
    fBodyAccJerk-meanFreq()-X
    fBodyAccJerk-meanFreq()-Y
    fBodyAccJerk-meanFreq()-Z
    fBodyGyro-mean()-X
    fBodyGyro-mean()-Y
    fBodyGyro-mean()-Z
    fBodyGyro-std()-X
    fBodyGyro-std()-Y
    fBodyGyro-std()-Z
    fBodyGyro-meanFreq()-X
    fBodyGyro-meanFreq()-Y
    fBodyGyro-meanFreq()-Z
    fBodyAccMag-mean()
    fBodyAccMag-std()
    fBodyAccMag-meanFreq()
    fBodyBodyAccJerkMag-mean()
    fBodyBodyAccJerkMag-std()
    fBodyBodyAccJerkMag-meanFreq()
    fBodyBodyGyroMag-mean()
    fBodyBodyGyroMag-std()
    fBodyBodyGyroMag-meanFreq()
    fBodyBodyGyroJerkMag-mean()
    fBodyBodyGyroJerkMag-std()
    fBodyBodyGyroJerkMag-meanFreq()

The explanation of these features can be found inside the file *features_info.txt* from the original data set linked above.

## The R script

The *run_analysis.R* is an R script that takes as input some of the files from the original data set and produces a new data frame that follows the principles of tidy data.

We will briefly summarize the steps taken by the script:

1. Read the following files with the *read.table* command:

> * *features.txt* (561 variables)
> * *subject_train.txt* (vector with the id of the subjects for each observation of the training set)
> * *subject_test.txt* (vector with the id of the subjects for each observation of the test set)
> * *y_train.txt* (vector with the id of the 6 possible activities for each observation of the train set)
> * *y_test.txt" (vector with the id of the 6 possible activities for each observation of the test set)
> * *X_train.txt* (7352 x 561 matrix with all the observations from the training set)
> * *X_test.txt* (2947 x 561 matrix with all the observations from the test set)
2. Merge the vectors and data frames from all those files in one big data set of 10,299 observations and 563 columns.
3.  Add descriptive column headers to set, being the first two the subject ID and the type of activity.
4. Subsets the data frame leaving only mean and standard deviation variables, reducing the columns down to 79 variables plus the subject id and activity type columns.
5. Apply descriptive activity labels to activity column in data frame.
6. Reshape the data frame to produce a new one with the average of each variable for each activity and each subject (2370 rows x 8 columns). 
7. Write the final, tidy set to file *setmeans.txt*.


## The final, tidy data set

The 8 variables (columns) in the data set are:

> * subjectID: The number of the experiment subject - from 1 to 30.
> * variable: The 79 selected features from the time and frequency domain.
> * the other six are self-explanatory: walking, walkingUpstairs, walkingDownstairs, sitting, standing and laying.

As an example, these are the first 6 rows of the final data set following the command `head(Cset)`

   subjectID          variable     walking
1         1 tBodyAcc-mean()-X  0.27733076
2         1 tBodyAcc-mean()-Y -0.01738382
3         1 tBodyAcc-mean()-Z -0.11114810
4         1  tBodyAcc-std()-X -0.28374026
5         1  tBodyAcc-std()-Y  0.11446134
6         1  tBodyAcc-std()-Z -0.26002790
  walkingUpstairs walkingDownstairs
1     0.255461690       0.289188320
2    -0.023953149      -0.009918505
3    -0.097302002      -0.107566191
4    -0.354708025       0.030035338
5    -0.002320265      -0.031935943
6    -0.019479239      -0.230434213
       sitting            standing      laying
1  0.261237565  0.27891763  0.22159824
2 -0.001308288 -0.01613759 -0.04051395
3 -0.104544182 -0.11060182 -0.11320355
4 -0.977229008 -0.99575990 -0.92805647
5 -0.922618642 -0.97319006 -0.83682741
6 -0.939586291 -0.97977588 -0.82606140

Therefore, each row shows for each subject ID the average value of each variable in the different six types of activity.

