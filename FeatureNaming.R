## Function to lean feature names for easy readability and subsetting later on
## and name the features in the feature sets
nameFeatures <- function(f) {
	
	## A character vector containing original feature names
	New_Feature_Name <- as.character(f[,2])

	## Replace -mean() with MeanValue
	New_Feature_Name <- gsub("-mean()", "MeanValue", New_Feature_Name, fixed=TRUE)

	## Replace -std() with StDev
	New_Feature_Name <- gsub("-std()", "StDev", New_Feature_Name, fixed=TRUE)

	## Replace -X with DirX
	New_Feature_Name <- gsub("-X", "DirX", New_Feature_Name, fixed=TRUE)

	## Replace -Y with DirY
	New_Feature_Name <- gsub("-Y", "DirY", New_Feature_Name, fixed=TRUE)

	## Replace -Z with DirZ
	New_Feature_Name <- gsub("-Z", "DirZ", New_Feature_Name, fixed=TRUE)
	
	f_new <- cbind(f, New_Feature_Name)
}