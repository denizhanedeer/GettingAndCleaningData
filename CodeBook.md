#Introduction

The script run_analysis.R performs the 5 steps described in the course project's definition.

*First, all the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.

*Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.

*As activity data is addressed with values 1 to 6 , we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.

*On the whole dataset, those columns names are corrected.

*Finally, we generate a new dataset with all the average measures for each subject and activity type. The output file is called average.txt, and uploaded to this repository

# Variables and Functions 

## Variables 

x_train <- data set coming from X_train.txt under the train folder

y_train <- data set coming from y_train.txt under the train folder

subject_train <- data set coming from subject_train.txt under the train folder

x_test <- data set coming from X_test.txt under the test folder

y_test <- data set coming from y_test.txt under the test folder

subject_test <- data set coming from subject_test.txt under the test folder

activity <- list coming from activity_labels.txt file

features <- data set from features.txt file

After we read all related data we bind some of them and create new variables :

*x_data* = x_train and x_test / *y_data* = y_train and y_test / *subject_data* = subject_data and subject_test

**final_data** merged data from *x_data*,*y_data*,*subject_data*

**average** is data.frame  average of related columns from final_data. 

## Functions 

We have used some built-in fucntions from cran. You may need to add library(plyr) for some of them but our run_analysis.R already does it for you. 

rbind() / cbind() = binding columns and rows 

names() = assign new name to a variable

read.table() = reading table from directory

write.table() = writing out talbe format data

ddply = summarizing your data by variables requires plyr package (you can use summarizeBy() with library(doBy)

grep() = search a particular pattern over a vector. 
