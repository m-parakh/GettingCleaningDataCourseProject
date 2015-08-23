## Function to create tidy data set
createTidyData <- function() {
	library(reshape2)

	meltResult <- melt(activitynameData, id=c("Subject_ID", "Activity_ID", "Activity_Name"))
	castResult <- dcast(meltResult, Activity_Name + Subject_ID ~ variable, fun.aggregate = mean, na.rm=TRUE)
}