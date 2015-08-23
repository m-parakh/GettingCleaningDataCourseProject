## Source the code in from other scripts
source("DataLoadinginR.R")
source("FeatureNaming.R")
source("DataBinding.R")
source("DataExtraction.R")
source("ActivityNaming.R")
source("TidyDataCreation.R")

## Name the features properly
features_revised <- nameFeatures(features)
names(X_train) <- features_revised$New_Feature_Name
names(X_test) <- features_revised$New_Feature_Name

## Create merged dataset
mergedData <- bindData()

## Get relevant mean and stdev data by subsetting
relevantData <- extractDataSubset()

## Bring in activity names
activitynameData <- includeActivityNames()

## Create tidy dataset
tidyData <- createTidyData()

## Write tidy dataset to a text file
write.table(tidyData, "HAR_tidydata.txt", row.name=FALSE)

