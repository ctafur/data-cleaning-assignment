
### location of files

main <- "./UCI HAR Dataset/"        # main folder
test <- "./UCI HAR Dataset/test/"    # test folder
train <- "./UCI HAR Dataset/train/"  # training data folder

### Read columnn headers file

columnHeaders <- read.table(paste0(main, "features.txt"))

######### Read training set ##########

### Subject's ID number

trainID <- read.table(paste0(train, "subject_train.txt"))

### Type of activity (from 1 to 6)

trainActivity <- read.table(paste0(train, "y_train.txt"))

### Training set variables

trainSet <- read.table(paste0(train, "X_train.txt"))

# add columns from trainActivity and trainID to trainSet

trainSet <- data.frame(trainID, trainActivity, trainSet)

# to save memory space, we can now safely remove trainActivity and trainID

rm(trainActivity, trainID)

######### Read test set ##########

### Subject's ID number

testID <- read.table(paste0(test, "subject_test.txt"))

### Type of activity (from 1 to 6)

testActivity <- read.table(paste0(test, "y_test.txt"))

### Test set variables

testSet <- read.table(paste0(test, "X_test.txt"))

# add columns from testActivity and testID to testSet

testSet <- data.frame(testID, testActivity, testSet)

# to save memory space, we can now safely remove testActivity and testID

rm(testActivity, testID)

### Merge the training and the test set in one big data set of 10,299 observations

set <- rbind(testSet, trainSet)

# to save memory space, we can now safely remove testSet and trainSet

rm(testSet, trainSet)

### Add descriptive column headers to set
### first two columns are subjectID and type of activity

colnames(set) <- c("subjectID", "activity", as.character(columnHeaders$V2))

### Subsetting only mean and standard deviation variables:
# We use a regular expression with the grep function that finds column names with the 
# string "mean" or "std" in it. We also add the subjectId and activity type
# in columns 1 and 2.

subset <- set[,c(1:2, grep("mean|std", colnames(set)))]

# to save memory space, we can now safely remove the original set

rm(set)

### Convert to factor and apply descriptive activity labels
### to activity column in data frame

subset$activity <- factor(subset$activity,
                          labels=c("walking", "walkingUpstairs",
                                   "walkingDownstairs", "sitting", "standing", "laying"))


### Reshape data frame to produce a new data frame with
### the average of each variable for each activity and each subject. 

library(reshape2)

# create a melted set with subjectID and activity as ID

mSet <- melt(subset, id.vars=c("subjectID", "activity"))

# cast the data set to produce the final three dimensional array

cSet <- dcast(mSet, subjectID + variable ~ activity, mean, margins=FALSE)

### Write the final, tidy dataset to a text file

write.table(cSet, "setmeans.txt")

