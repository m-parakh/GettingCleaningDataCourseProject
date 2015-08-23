## Function to name activities
includeActivityNames <- function() {
	result <- merge(relevantData, activity_labels, by.x="Activity_ID", by.y="Activity_ID", all=FALSE)
}