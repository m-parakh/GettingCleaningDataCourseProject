## Function to extract mean and standard deviation from each measurement
extractDataSubset <- function() {
	library(dplyr)

	## Get vector to select columns containing Subject_ID
	subject_cols <- grep("Subject_ID",names(mergedData), fixed=TRUE)

	## Subset the merged training+test dataset to extract only the Subject_ID column
	Subject_ID <- mergedData[, subject_cols]

	## Get vector to select columns containing Activity_ID
	act_cols <- grep("Activity_ID",names(mergedData), fixed=TRUE)

	## Subset the merged training+test dataset to extract only the Activity_ID column
	Activity_ID <- mergedData[, act_cols]
	
	## Get vector to select rows of features 
	## containing mean of measurements
	mean_cols <- grep("MeanValue",names(mergedData), fixed=TRUE)

	## Subset the merged training+test dataset to
	## extract only the mean features
	mean_dataset <- mergedData[, mean_cols]

	## Get vector to select rows of features 
	## containing StDev of measurements
	std_cols <- grep("StDev",names(mergedData), fixed=TRUE)

	## Subset the merged training+test dataset to
	## extract only the StDev features
	std_dataset <- mergedData[, std_cols]

	relevant_dataset <- cbind(Subject_ID, Activity_ID, mean_dataset, std_dataset)
}