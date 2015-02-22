## The run_analysis.R script merges the training and test sets to create one data set.
## The script extracts only the measurements on the mean and standard deviation for each measurement.
## The script renames activities in the data set with appropriately descriptive activity names.
## The script also labels the data set with descriptive variable names.
## Out of the resulting data set, the script creates another independent tidy data set.
## This independent data set contains the average of each variable for each activity and each subject.
## First, load the dplyr package.
## Just do install.packages the first time the script is run.
## The "install.packages" line is commented out for subsequent runs of the script.
## install.packages("dplyr")
library(dplyr)
## Download and read in the training dataset the first time the script is run.
## Download and read in the test dataset the first time the script is run.
## Read in features.txt file.
features_df <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", sep = " ", skip=0)
## Add column labels to features_df data frame.
names(features_df) <- c("feature_num", "feature_name")
## Use make.names function to change illegal characters (parentheses and minus sign) to dots.
## Also change the names of duplicates of the feature_name.
features_df[,"feature_name"] <- make.names(features_df[,"feature_name"], unique=TRUE)
# Read in activity_labels.txt file.
activity_df <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", sep = " ", skip=0)
## Add column labels to activity_df data frame.
names(activity_df) <- c("activity_num", "activity_name")
## Read in subject_train.txt file.
subject_train_df <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", sep = " ", skip=0)
## Add column labels to subject_train_df data frame.
names(subject_train_df) <- c("subject_num")
## Read in X_train.txt file.
X_train_df <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", skip=0)
## Add column labels to X_train_df data frame.
names(X_train_df) <- features_df$feature_name
## Read in y_train.txt file
y_train_df <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", skip=0)
## Add column label to y_train_df data frame.
names(y_train_df) <- c("activity_num")
## Read in subject_test.txt file.
subject_test_df <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", skip=0)
## Add column label to subject_test_df data frame
names(subject_test_df) <- c("subject_num")
## Read in X_test.txt file.
X_test_df <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", skip=0)
## Add column labels to X_test_df data frame.
names(X_test_df) <- features_df$feature_name
## Read in y_test.txt file
y_test_df <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", skip=0)
## Add column label to y_test_df data frame.
names(y_test_df) <- c("activity_num")
## Merge three separate training sets into composite training dataset
training_df <- cbind(subject_train_df, y_train_df, X_train_df)
## Merge three separate test sets into composite test dataset
test_df <- cbind(subject_test_df, y_test_df, X_test_df)
## Merge training and test sets to create one data set called combined_test_training_df.
combined_test_training_df <- rbind(training_df, test_df)
## Extract only the measurements on the mean and standard deviation for each measurement.
## For this script, the decision was made that the measurements of mean for each measurement
## are ones that include the characters "mean" in lowercase or "Mean" with an uppercase "M."
## The characters "std" found in the dataset are lowercase, but case is ignored for "std" as well.
## Select column headings containing either "mean" or "std."
## Based on the decision of what constitutes a mean or standard deviation measurement,
## case is ignored when using the select function.
## Use select function in dplyr package.
## Resulting data set is called res_df.
res_df <- select(combined_test_training_df, subject_num, activity_num, contains("mean", ignore.case=TRUE), contains("std", ignore.case=TRUE))
## Name the activities in the data set, res_df.
## Replace activity_num (column 2) in res_df with the corresponding string, 
## which is the appropriate activity name.
res_df[,2] <- activity_df[res_df[,2], "activity_name"]
## Change the labels in the data set, res_df, to descriptive variable names.
names(res_df)[1] <- "Subject"
names(res_df)[2] <- "Activity"
names(res_df) <- gsub("^t", "time", names(res_df))
names(res_df) <- gsub("Acc", "Accelerometer", names(res_df))
names(res_df) <- gsub("Gyro", "Gyroscope", names(res_df))
names(res_df) <- gsub("Freq", "Frequency", names(res_df))
names(res_df) <- gsub("BodyBody", "Body", names(res_df))
names(res_df) <- gsub("Mag", "Magnitude", names(res_df))
names(res_df) <- gsub("^f", "frequency", names(res_df))
## Clean up names by taking out extra dots.
names(res_df) <- gsub("gravityMean\\.", "gravityMean", names(res_df))
names(res_df) <- gsub("gravity\\.", "gravity", names(res_df))
names(res_df) <- gsub("\\.\\.\\.", "", names(res_df))
names(res_df) <- gsub("\\.\\.", "", names(res_df))
## Create a second, independent tidy data set with the average of each variable computed
## for each activity and each subject.
## Set intermediate values before grouping.
by1 <- res_df$Subject
by2 <- res_df$Activity
## Group by each activity and each subject and take the mean of each feature variable.
td_df <- aggregate(res_df[-(1:2)], by = list(by1, by2), FUN = "mean")
## Replace the dummy names put in by the aggregate function with the true data set names.
names(td_df)[1] <- names(res_df)[1]
names(td_df)[2] <- names(res_df)[2]
## Sort rows in ascending order, first by subject then by activity.
ord <- order(td_df$Subject, td_df$Activity)
sorted_df <- td_df[ord,]
## Write the tidy data set as a text file without the row name that was added when sorted_df was created.
write.table(sorted_df, file="tidy_dataset.txt", row.name=FALSE)
## Here is the code I have been using to look at the tidy data set(tidy_dataset.txt) in R.
## My code assumes that I am in the directory where the tidy_dataset.txt file is located.
## tidy_data <- read.table("tidy_dataset.txt", header = TRUE)
## To look at the names of the variables, I do the following in the R console --
## print(names(tidy_data))
## I check just the first six lines with the following code --
## print(head(tidy_data))
## I also look at the entire file with the code --
## View(tidy_data)
