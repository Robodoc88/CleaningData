CleanData
=========

Repository for Course Project for Getting and Cleaning Data

This is the repository for the tidy data set and run_analysis.R file required for the course project for Getting and Cleaning Data.

The data was originally obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  The file was unzipped to "UCI HAR Dataset" folder.  From "train" folder, X_train.txt, y_train.txt, subject_train.txt files were loaded to R studio.  From "test" folder, X-test.txt, y_test.txt,  and subject_test.txt files were loaded to R studio.  The feature.txt file was loaded and used as the column names for the data sets from "train" and "test" folders.  The two data sets were merged using rbind().  Then the columns of variable means and std were identified.  A new data set was created including only these variables.

The new data set was reshaped into "skinny tall data set" with "melt" function, and the final tidy data set was created with "dcast" function.

In this repository, the following files were included:
  run_analysis.R    The R file that processes the downloaded data sets and transforms it into final tidy data set.
  report.txt        The tiny data set that includes the mean of measured variables for each subject and each activity.
  codebook.txt      The codebook that explain the columns of data set
