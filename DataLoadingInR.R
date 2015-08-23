# Load data in the global environment

## Load activity and feature labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
									col.names=c("Activity_ID", "Activity_Name"))

features <- read.table("UCI HAR Dataset/features.txt", 
							col.names=c("Feature_ID", "Feature_Name"))

## Load training data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", 
								col.names=c("Subject_ID"))

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")

y_train <- read.table("UCI HAR Dataset/train/y_train.txt",
							col.names=c("Activity_ID"))

## Load test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", 
								col.names=c("Subject_ID"))

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")

y_test <- read.table("UCI HAR Dataset/test/y_test.txt", 
							col.names=c("Activity_ID"))