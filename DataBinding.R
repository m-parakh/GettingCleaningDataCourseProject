## Function to bind and export a combined dataset by 
## first combining the feature set with the subject and activity ids of training and test datasets
## and then combining those two into a single dataset
bindData <- function() {
	## Bind training data
	train_dataset <- cbind(subject_train, y_train, X_train)

	## Bind test data
	test_dataset <- cbind(subject_test, y_test, X_test)

	## Combine training and test datasets
	complete_dataset <- rbind(train_dataset, test_dataset)
}