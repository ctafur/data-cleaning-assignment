data-cleaning-assignment
========================

## Getting and cleaning data project for Coursera's Data Science Track

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.
The data in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
The R script provided in this repository does the following:
* Merges the training and the test set to create a single data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set.
* And finally, it creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The final output file is also included in the repository with the name "setmeans.txt"
The R script only works if the file from the above link is downloaded, unzipped and saved in your current R working directory.
