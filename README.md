## Documentation for course project 

***
The goal of this project was to clean and transform the
Human Activity Recognition Using Smartphones data set 
obtained from University of California, Irvine into a tidy data set.

***
The "run_analysis.R" script sources the other scripts described below.
It calls functions from the other scripts to transform the provided data.

***
The "DataLoadingInR.R" script loads the data into R for 
activity labels, feature variable names, and training and test data sets.

***
The "FeatureNaming.R" script contains a function nameFeatures(f) that
replaces strings "-mean()", "-std()", "-X", "-Y", "-Z" 
from feature variables with "MeanValue", "StDev", "DirX", "DirY", "DirZ".
These revised names are then used as column names for X_train and X_test data sets
to avoid errors later on during binding and subsetting of data sets.

***
The "DataBinding.R" script contains a function bindData() that creates a 
merged set of training and test data.

***
The "DataExtraction.R" script contains a function extractDataSubset() that
subsets the merged data set to only include the variable columns that contain
the mean and standard deviation of measurements. My approach is not optimal -- 
I extracted the subject_id, activity_id, columns containing measurement means,
and columns containing measurement standard deviations. 
Then I stitched them back together. I tried a few other ways of doing this, but kept
getting errors, so finally took this route.

***
The "ActivityNaming.R" script contains a function that merges the activity names with
the the extracted relevant data subset.

***
The "TidyDataCreation.R" script contains a function createTidyData() that uses the
the melt and dcast functions from the Reshape2 package to create a wide tidy data set.

***
This tidy data set is then written out to a text file.

***
