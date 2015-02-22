##  README.md file for Getting and Cleaning Data course project

The R script called run_analysis.R performs the following transformations on the raw data:

The script first merges the training and test sets to create one data set.
The script then extracts only the measurements on the mean and standard deviation for each measurement.
The script subsequently renames activities in the data set with appropriately descriptive activity names.
The script also labels the data set with descriptive variable names.
Out of the resulting data set, the script creates another independent tidy data set.
This independent data set contains the average of each variable for each activity and each subject.

## Steps in run_analysis.R script to transform raw data into tidy data set

These are the specific steps in run_analysis.R that perform the transformations upon the raw data:

1. First, the script reads the data into the features_df data frame.
2. Then the script adds column labels to the features_df data frame.
3. The script then uses the make.names function to change illegal characters (parentheses and minus sign) to dots.
4. The script also changes the names of duplicates of the feature_name.
5. Then the script reads in the activity_labels.txt file.
6. Next, the script adds column labels to the activity_df data frame.
7. Then the script reads in the subject_train.txt file.
8. After that, column labels are added to the subject_train_df data frame.
9. The next step is to read in the X_train.txt file.
10. Then, column labels are added to the X_train_df data frame.
11. The script then reads in the y_train.txt file.
12. Column labels are added to the y_train_df data frame.
13. Then the script reads in the subject_test.txt file.
14. Column labels are added to the subject_test_df data frame.
15. Then the script reads in the X_test.txt file.
16. Column labels are added to the X_test_df data frame.
17. After that, the script reads in the y_test.txt file.
18. Column labels are then added to the y_test_df data frame.
19. The script merges the three separate training sets into a composite training data set.
20. Then the script merges the three separate test sets into a composite test data set.
21. After that, the script merges the training and test sets to create one data set. 
22. The script then extracts only the measurements on the mean and standard deviation for each measurement. For this script, the  decision was made that the measurements of mean for each measurement are ones that include the characters "mean" in lowercase or "Mean" with an uppercase "M" and include those that are indicated by the  characters "meanFreq".
23. The standard deviation measurements were indicated by the characters "std".
24. The script does the extraction by selecting column headings containing "mean", "Mean" or "meanFreq", or "std", and the resulting data set is called res_df.
25. The script then names the activities in the data set, res_df.
26. The next step in the script is to replace the second column in the res_df data frame, which is labeled activity_num, with the corresponding string, which is the appropriate activity name.
27. Next the script changes the labels in the data set, res_df, to descriptive variable names.
28. The script then creates a second, independent tidy data set with the average of each variable computed for each activity and each subject. The data are grouped by each activity and each subject and the mean of each feature variable is computed.
29. The rows are then sorted in ascending order, first by subject then by activity.
30. The script then writes the tidy data set as a text file named tidy_dataset.txt without the row names that were added when the data frame, sorted_df, was created.

## Resulting tidy data set:

The data set (the file tidy_dataset.txt) produced by the R script called run_analysis.R is tidy because each variable that is measured is in one column, and each observation of that variable is in a different row. The resulting data  set has 180 rows and 88 columns. The rows have been sorted in ascending order, first by subject and then by activity.

## Reading the tidy data set

It is difficult to look at the tidy data set as a text file in Notepad or Wordpad.
The file is readable in R and appropriate R code is provided below to allow the reader to view the file in R.
Assuming the code is run in the directory where the tidy_dataset.txt file is located, the following code can be run in the R console:

#### R code to read the tidy_dataset.txt file into a data frame named tidy_data:

```
tidy_data <- read.table("tidy_dataset.txt", header = TRUE)
```

Then the entire file can be viewed with the following code:

```
View(tidy_data)
```

To look at the names of the variables, the following code can be used in the R console:

```
print(names(tidy_data))
```

Just the first six lines of tidy_data can be seen by executing the following code:

```
print(head(tidy_data))
```
