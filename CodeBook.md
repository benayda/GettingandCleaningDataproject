## CodeBook.md file for Getting and Cleaning Data course project

## Experimental design and background:

The description of the experimental design and background information was gathered from the Human Activity Recognition Using Smartphones Data Set described in the UCI Machine Learning Repository at this site --

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A series of experiments was performed using a group of thirty volunteers, ranging in age from 19 to 48 years old.
Each volunteer in the experiment was asked to perform six activities of daily living, often referred to ADLs in the research literature.

The six activities performed were: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. All of these activities were performed by the volunteers while they were wearing a Samsung Galaxy S II smartphone on their waists. 

The following measurements were captured using the smartphone's embedded accelerometer and gyroscope: 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 3-axial indicates that these measurements were captured along x, y, and z axes.

The experiments were recorded with video. This video was used to see which activity was being performed and appropriate labels were then assigned to the data. This labeling process was performed manually. The resulting data set was then randomly divided into two sets: one set of data for 70% of the volunteers, comprising the training data set, and the data for the remaining 30% of the volunteers, comprising the test data set. 

The sensor signals, that is, the measurements from the accelerometer and gyroscope, were pre-processed by applying noise filters. Then they were sampled in fixed-width sliding windows of 2.56 seconds and 50% overlap, resulting in 128 readings per window. The sensor acceleration signal with its gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. Since the gravitational force was assumed to have only low frequency components, a filter with a cutoff frequency of 0.3 Hz was used. From each window, calculating variables from the time and frequency domain resulted in a vector of features.

## Raw Data and Attribute Information:

Each record in the set of raw data included the following measurements and labels to identify the activity performed and the subject performing the activity:

- A 561-feature vector with time and frequency domain variables. 
- A label indicating the type of activity the subject was performing. 
- An identifier indicating the subject who carried out the experiment, whose measurements are included.

## R script, run_analysis.R

The R script performs the following transformations on the raw data:

The run_analysis.R script merges the training and test sets to create one data set.
The script extracts only the measurements on the mean and standard deviation for each measurement.
The script renames activities in the data set with appropriately descriptive activity names.
The script also labels the data set with descriptive variable names.
Out of the resulting data set, the script creates another independent tidy data set.
This independent data set contains the average of each variable for each activity and each subject.

## Steps in run_analysis.R script to transform raw data into tidy data set

These are the specific steps in run_analysis.R that perform the transformations upon the raw data:

1. First, the script reads the data into the features_df data frame.
2. Then the script adds column labels to the features_df data frame.
3. The script then uses the make.names function to change illegal characters (parentheses and minus sign) to dots.
The script also changes the names of duplicates of the feature_name.
Then the script reads in the activity_labels.txt file.
Next, the script adds column labels to the activity_df data frame.
Then the script reads in the subject_train.txt file.
After that, column labels are added to the subject_train_df data frame.
The next step is to read in the X_train.txt file.
Then, column labels are added to the X_train_df data frame.
The script then reads in the y_train.txt file.
Column labels are added to the y_train_df data frame.
Then the script reads in the subject_test.txt file.
Column labels are added to the subject_test_df data frame.
Then the script reads in the X_test.txt file.
Column labels are added to the X_test_df data frame.
After that, the script reads in the y_test.txt file.
Column labels are then added to the y_test_df data frame.
The script merges the three separate training sets into a composite training data set.
Then the script merges the three separate test sets into a composite test data set.
After that, the script merges the training and test sets to create one data set. The script then extracts only the measurements on the mean and standard deviation for each measurement. For this script, the  decision was made that the measurements of mean for each measurement are ones that include the characters "mean" in lowercase or "Mean" with an uppercase "M" and include those that are indicated by the  characters "meanFreq".
The standard deviation measurements were indicated by the characters "std".
The script does the extraction by selecting column headings containing either "mean" or "std" and the resulting data set is called res_df.
The script then names the activities in the data set, res_df.
The next step in the script is to replace the second column in the res_df data frame, which is labeled activity_num, with the corresponding string, which is the appropriate activity name.
Next the script changes the labels in the data set, res_df, to descriptive variable names.
The script then creates a second, independent tidy data set with the average of each variable computed for each activity and each subject.
The data are grouped by each activity and each subject and the mean of each feature variable is computed.
The rows are then sorted in ascending order, first by subject then by activity.
The script then writes the tidy data set as a text file named tidy_dataset.txt without the row names that were added when the data frame, sorted_df, was created.

## Resulting tidy data set:

The data set produced by the R script called run_analysis.R is tidy because each variable that is measured is in one column, and each observation of that variable is in a different row. The resulting data set has 180 rows and 88 columns. The rows have been sorted in ascending order, first by subject and then by activity.

The 180 rows in the tidy data set are generated for 30 subjects performing six different activities.

The 88 columns in the tidy data set are described below, with column numbers along with the name of each variable and a brief explanation of the feature variable in that column.

#### Explanation of Variables

Each of the values in columns 3 through 88 is the mean of each feature variable computed for each activity and each subject.
The description is for the feature variable, but the value we computed for each feature variable is the mean for that particular feature variable for each activity and each subject.

[1] "Subject" - an identifier to denote a volunteer who participated in the experiment, either in the training or the test data set                                             
[2] "Activity" - the name of each activity of daily living performed by the volunteers in the experiment. There were six different activities performed.                                            
[3] "timeBodyAccelerometer.meanX" - mean of time domain signal for linear acceleration measurement of the body along x axis                         
[4] "timeBodyAccelerometer.meanY" - mean of time domain signal for linear acceleration measurement of the body along y axis                         
[5] "timeBodyAccelerometer.meanZ" - mean of time domain signal for linear acceleration measurement of the body along z axis                          
[6] "timeGravityAccelerometer.meanX" - mean of time domain signal for gravitational measurement of the body along x axis                     
[7] "timeGravityAccelerometer.meanY" - mean of time domain signal for gravitational measurement of the body along y axis                      
[8] "timeGravityAccelerometer.meanZ" - mean of time domain signal for gravitational measurement of the body along z axis                      
[9] "timeBodyAccelerometerJerk.meanX" - mean of time domain signal for body accelerometer jerk along x axis                     
[10] "timeBodyAccelerometerJerk.meanY"- mean of time domain signal for body accelerometer jerk along y axis                      
[11] "timeBodyAccelerometerJerk.meanZ"- mean of time domain signal for body accelerometer jerk along z axis                     
[12] "timeBodyGyroscope.meanX" - mean of time domain signal for angular velocity measurement of the body along x axis                            
[13] "timeBodyGyroscope.meanY" - mean of time domain signal for angular velocity measurement of the body along y axis                             
[14] "timeBodyGyroscope.meanZ" - mean of time domain signal for angular velocity measurement of the body along z axis                             
[15] "timeBodyGyroscopeJerk.meanX" - mean of time domain signal for angular jerk measurement along x axis                          
[16] "timeBodyGyroscopeJerk.meanY" - mean of time domain signal for angular jerk measurement along y axis                         
[17] "timeBodyGyroscopeJerk.meanZ" - mean of time domain signal for angular jerk measurement along z axis                         
[18] "timeBodyAccelerometerMagnitude.mean"- mean of time domain signal for body accelerometer magnitude                  
[19] "timeGravityAccelerometerMagnitude.mean" -  mean of time domain signal for gravity accelerometer magnitude               
[20] "timeBodyAccelerometerJerkMagnitude.mean" - mean of time domain signal for body accelerometer jerk magnitude              
[21] "timeBodyGyroscopeMagnitude.mean" - mean of time domain signal for angular velocity magnitude                      
[22] "timeBodyGyroscopeJerkMagnitude.mean" - mean of time domain signal for angular jerk magnitude                 
[23] "frequencyBodyAccelerometer.meanX" - mean of frequency domain signal for linear acceleration measurement of the body along x axis                    
[24] "frequencyBodyAccelerometer.meanY" - mean of frequency domain signal for linear acceleration measurement of the body along y axis                    
[25] "frequencyBodyAccelerometer.meanZ" - mean of frequency domain signal for linear acceleration measurement of the body along z axis                   
[26] "frequencyBodyAccelerometer.meanFrequencyX" - Weighted average of the frequency components to obtain a mean frequency of accelerometer measurements along x axis
           
[27] "frequencyBodyAccelerometer.meanFrequencyY" - Weighted average of the frequency components to obtain a mean frequency of accelerometer measurements along y axis           
[28] "frequencyBodyAccelerometer.meanFrequencyZ" - Weighted average of the frequency components to obtain a mean frequency of accelerometer measurements along z axis          
[29] "frequencyBodyAccelerometerJerk.meanX" - mean of frequency domain signal for body accelerometer jerk along x axis                
[30] "frequencyBodyAccelerometerJerk.meanY" - mean of frequency domain signal for body accelerometer jerk along y axis                
[31] "frequencyBodyAccelerometerJerk.meanZ" - mean of frequency domain signal for body accelerometer jerk along z axis                
[32] "frequencyBodyAccelerometerJerk.meanFrequencyX" - Weighted average of the frequency components to obtain a mean frequency of jerk measurements along x axis        
[33] "frequencyBodyAccelerometerJerk.meanFrequencyY" - Weighted average of the frequency components to obtain a mean frequency of jerk measurements along y axis       
[34] "frequencyBodyAccelerometerJerk.meanFrequencyZ" - Weighted average of the frequency components to obtain a mean frequency of jerk measurements along z axis       
[35] "frequencyBodyGyroscope.meanX" - mean of frequency domain signal for angular velocity measurement of the body along x axis                       
[36] "frequencyBodyGyroscope.meanY" - mean of frequency domain signal for angular velocity measurement of the body along y axis                         
[37] "frequencyBodyGyroscope.meanZ" - mean of frequency domain signal for angular velocity measurement of the body along z axis                       
[38] "frequencyBodyGyroscope.meanFrequencyX" - Weighted average of the frequency components to obtain a mean frequency of angular velocity measurements along x axis               
[39] "frequencyBodyGyroscope.meanFrequencyY" - Weighted average of the frequency components to obtain a mean frequency of angular velocity measurements along y axis               
[40] "frequencyBodyGyroscope.meanFrequencyZ" - Weighted average of the frequency components to obtain a mean frequency of angular velocity measurements along z axis               
[41] "frequencyBodyAccelerometerMagnitude.mean" - mean of frequency domain signal for body accelerometer magnitude           
[42] "frequencyBodyAccelerometerMagnitude.meanFrequency" - weighted average of the frequency components to obtain a mean frequency of accelerometer magnitude measurements   
[43] "frequencyBodyAccelerometerJerkMagnitude.mean" - mean of frequency domain signal for body accelerometer jerk magnitude        
[44] "frequencyBodyAccelerometerJerkMagnitude.meanFrequency" - weighted average of the frequency components to obtain a mean frequency of accelerometer jerk magnitude measurements
[45] "frequencyBodyGyroscopeMagnitude.mean" - mean of frequency domain signal for angular velocity magnitude                 
[46] "frequencyBodyGyroscopeMagnitude.meanFrequency" - weighted average of the frequency components to obtain a mean frequency of angular velocity magnitude measurements       
[47] "frequencyBodyGyroscopeJerkMagnitude.mean"- mean of frequency domain signal for body accelerometer magnitude             
[48] "frequencyBodyGyroscopeJerkMagnitude.meanFrequency" - weighted average of the frequency components to obtain a mean frequency of angular velocity jerk magnitude measurements  
[49] "angle.tBodyAccelerometerMean.gravity" - mean angle between the time domain signal for body acceleration and the direction of gravity                 
[50] "angle.tBodyAccelerometerJerkMeangravityMean" - mean angle between the time domain signal for body jerk and the direction of gravity          
[51] "angle.tBodyGyroscopeMean.gravityMean" - mean angle between the time domain signal for angular velocity and the direction of gravity                
[52] "angle.tBodyGyroscopeJerkMean.gravityMean" - mean angle between the time domain signal for angular jerk and the direction of gravity             
[53] "angle.X.gravityMean"- mean angle between X direction and the direction of gravity                                 
[54] "angle.Y.gravityMean"- mean angle between Y direction and the direction of gravity                                  
[55] "angle.Z.gravityMean"- mean angle between Z direction and the direction of gravity                                  
[56] "timeBodyAccelerometer.stdX" - standard deviation of time domain signal for linear acceleration measurement of the body along x axis                          
[57] "timeBodyAccelerometer.stdY" - standard deviation of time domain signal for linear acceleration measurement of the body along y axis                           
[58] "timeBodyAccelerometer.stdZ" - standard deviation of time domain signal for linear acceleration measurement of the body along z axis                                                      
[59] "timeGravityAccelerometer.stdX" - standard deviation of time domain signal for gravitational measurement of the body along x axis                       
[60] "timeGravityAccelerometer.stdY" - standard deviation of time domain signal for gravitational measurement of the body along y axis                       
[61] "timeGravityAccelerometer.stdZ" - standard deviation of time domain signal for gravitational measurement of the body along z axis                       
[62] "timeBodyAccelerometerJerk.stdX"- standard deviation of time domain signal for accelerometer jerk measurement of the body along x axis                      
[63] "timeBodyAccelerometerJerk.stdY"- standard deviation of time domain signal for accelerometer jerk measurement of the body along y axis                       
[64] "timeBodyAccelerometerJerk.stdZ"- standard deviation of time domain signal for accelerometer jerk measurement of the body along z axis                       
[65] "timeBodyGyroscope.stdX" - standard deviation of time domain signal for angular velocity measurement of the body along x axis                              
[66] "timeBodyGyroscope.stdY" - standard deviation of time domain signal for angular velocity measurement of the body along y axis                              
[67] "timeBodyGyroscope.stdZ" - standard deviation of time domain signal for angular velocity measurement of the body along z axis                              
[68] "timeBodyGyroscopeJerk.stdX" - standard deviation of time domain signal for angular jerk measurement along x axis                           
[69] "timeBodyGyroscopeJerk.stdY" - standard deviation of time domain signal for angular jerk measurement along y axis                          
[70] "timeBodyGyroscopeJerk.stdZ" - standard deviation of time domain signal for angular jerk measurement along z axis                          
[71] "timeBodyAccelerometerMagnitude.std" - standard deviation of time domain signal for body accelerometer magnitude                  
[72] "timeGravityAccelerometerMagnitude.std" - standard deviation of time domain signal for gravitational measurement of accelerometer magnitude                
[73] "timeBodyAccelerometerJerkMagnitude.std"- standard deviation of time domain signal for gravitational measurement of accelerometer jerk magnitude               
[74] "timeBodyGyroscopeMagnitude.std" - standard deviation of time domain signal for angular velocity magnitude                     
[75] "timeBodyGyroscopeJerkMagnitude.std"- standard deviation of time domain signal for angular velocity jerk magnitude                  
[76] "frequencyBodyAccelerometer.stdX" - standard deviation of frequency domain signal for linear acceleration measurement of the body along x axis                     
[77] "frequencyBodyAccelerometer.stdY" - standard deviation of frequency domain signal for linear acceleration measurement of the body along y axis                     
[78] "frequencyBodyAccelerometer.stdZ" - standard deviation of frequency domain signal for linear acceleration measurement of the body along z axis                     
[79] "frequencyBodyAccelerometerJerk.stdX"- standard deviation of frequency domain signal for accelerometer jerk measurement of the body along x axis                  
[80] "frequencyBodyAccelerometerJerk.stdY"- standard deviation of frequency domain signal for accelerometer jerk measurement of the body along y axis                 
[81] "frequencyBodyAccelerometerJerk.stdZ"- standard deviation of frequency domain signal for accelerometer jerk measurement of the body along z axis                  
[82] "frequencyBodyGyroscope.stdX" - standard deviation of frequency domain signal for angular velocity measurement of the body along x axis                         
[83] "frequencyBodyGyroscope.stdY" - standard deviation of frequency domain signal for angular velocity measurement of the body along y axis                         
[84] "frequencyBodyGyroscope.stdZ" - standard deviation of frequency domain signal for angular velocity measurement of the body along z axis                         
[85] "frequencyBodyAccelerometerMagnitude.std"- standard deviation of frequency domain signal for linear acceleration magnitude measurement              
[86] "frequencyBodyAccelerometerJerkMagnitude.std" - standard deviation of frequency domain signal measured by gyroscope reading of the linear acceleration of the body         
[87] "frequencyBodyGyroscopeMagnitude.std"- standard deviation of frequency domain signal measured by gyroscope reading                  
[88] "frequencyBodyGyroscopeJerkMagnitude.std"- standard deviation of frequency domain signal measured by gyroscope reading of the angular velocity of the body   


## Citations and References:

A description of the data and the experimental design can be found at the following link --
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#### Citation:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

#### References: 

For more information about the data and the research underlying the experimental design, please see the following papers:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, Jorge L. Reyes-Ortiz. Energy Efficient Smartphone-Based Activity Recognition using Fixed-Point Arithmetic. Journal of Universal Computer Science. Special Issue in Ambient Assisted Living: Home Care. Volume 19, Issue 9. May 2013

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 4th International Workshop of Ambient Assited Living, IWAAL 2012, Vitoria-Gasteiz, Spain, December 3-5, 2012. Proceedings. Lecture Notes in Computer Science 2012, pp 216-223. 

Jorge Luis Reyes-Ortiz, Alessandro Ghio, Xavier Parra-Llanas, Davide Anguita, Joan Cabestany, Andreu Català. Human Activity and Motion Disorder Recognition: Towards Smarter Interactive Cognitive Environments. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
