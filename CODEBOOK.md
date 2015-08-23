## CodeBook for course project 

***
The "run_analysis.R" script sources the other scripts described below.
It calls functions from the other scripts to transform the provided data.

***
The "DataLoadingInR.R" script loads the data into R for 
activity labels, feature variable names, and training and test data sets.

	# "activity_labels" is a data table containing "Activity_ID", "Activity_Name"
		## "Activity_ID" has a number between 1 and 6 for each of the 6 activity types
		## "Activity_Name" contains a description of the activity performed (e.g., Walking)

	# "features" is a data table containing "Feature_ID", "Feature_Name"
		## "Feature_ID" contains a number between 1 and 561 for each of the 561 feature variables
		## "Feature_Name" contains a descriptive unique name for each variable

	# "subject_train" / "subject_test" is a data table that contains the "Subject_ID" for each record of the training /test data set
		## "Subject_ID" contains a number between 1 and 30 for each of the 30 subjects who participated in the study

	# "X_train" / "X_test" is a data table containing all records of values of each of the feature variables obtained from the study

	# "y_train" / "y_test" is a data table containing the "Activity_ID" for each record of the training / test data set

***
The "FeatureNaming.R" script contains a function nameFeatures(f) that
replaces strings "-mean()", "-std()", "-X", "-Y", "-Z" 
from feature variables with "MeanValue", "StDev", "DirX", "DirY", "DirZ".

	# features_revised <- nameFeatures(features) createas a new data table 
	containing a new column 'New_Feature_Name' for revised feature names.

These revised names are then used as column names for X_train and X_test data sets
to avoid errors later on during binding and subsetting of data sets.
	
	# names(X_train) <- features_revised$New_Feature_Name

	# names(X_test) <- features_revised$New_Feature_Name

***
The "DataBinding.R" script contains a function bindData() that creates a 
merged set of training and test data.
	
	# mergedData <- bindData() creates a new data table that contains 10299 rows and 563 columns.

	# The train_dataset is a combination of the provided tables: subject_train, y_train, and X_train 

	# The test_dataset is a combination of the provided tables: subject_test, y_test, and X_test

	# Then these two datasets are appended together to return the mergedData.

***
The "DataExtraction.R" script contains a function extractDataSubset() that
subsets the merged data set to only include the variable columns that contain
the mean and standard deviation of measurements. My approach is not optimal -- 
I extracted the subject_id, activity_id, columns containing measurement means,
and columns containing measurement standard deviations. 
Then I stitched them back together. I tried a few other ways of doing this, but kept
getting errors, so finally took this route.

	# relevantData <- extractDataSubset() creates a smaller data subset containing only the mean
	and standard deviation columns

	# subject_cols <- grep("Subject_ID",names(mergedData), fixed=TRUE) creates a 
	vector to select columns containing Subject_ID

	# Subject_ID <- mergedData[, subject_cols] creates a data subset from 'mergedData'
	to extract only the Subject_ID column

	# act_cols <- grep("Activity_ID",names(mergedData), fixed=TRUE) creates a 
	vector to select columns containing Activity_ID

	# Activity_ID <- mergedData[, act_cols] creates a data subset from 'mergedData'
	to extract only the Activity_ID column
	
	# mean_cols <- grep("MeanValue",names(mergedData), fixed=TRUE) creates vector to select columns of features 
	containing mean of measurements

	# mean_dataset <- mergedData[, mean_cols] creates a data subset from 'mergedData'
	extract only the mean features

	# std_cols <- grep("StDev",names(mergedData), fixed=TRUE) creates vector to select columns of features 
	containing StDev of measurements

	std_dataset <- mergedData[, std_cols] creates a data subset from 'mergedData'
	to extract only the standard deviation features

***
The "ActivityNaming.R" script contains a function that merges the activity names with
the the extracted relevant data subset.

	# activitynameData <- includeActivityNames() attaches the activity names to the 'relevantData' data table

***
The "TidyDataCreation.R" script contains a function createTidyData() that uses the
the melt and dcast functions from the Reshape2 package to create a wide tidy data set.

	# tidyData <- createTidyData() summarizes the mean of all included variables by 'Activity_Name' and 'Subject_Id'

***
This tidy data set is then written out to a text file.






