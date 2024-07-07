# Getting and Cleaning Data Course Project

The script run_analysis.R can be run to output the clean data as samsung_data.txt

It loads the data, merges it, extracts the means and standard deviations, adds labels, then generates means for all columns

The input data should be placed in a directory called "dataset", which includes the "train" and "test" folders, as well as the features.txt, features_info.txt, and activity_labels.txt files

## Process
Features are read into 'x_train', 'x_test', 'y_train', and 'y_test' Features are merged by row into 'x' and 'y'

Subjects are read into 'subject_train' and 'subject_test', and merged into 'subject'

Feaure names are read into 'features'

The indexes and values of the mean and standard deviation features are extracted with grep (The search term is "mean(" for the former to filter out meanFreq)

The names are added as column names

The indexes are used to extract the relevant columns from 'x'

The activity ids are replaced by the names from 'features.txt'

The relevant columns are merged with the subject and activity ids

dplyr is used to group the resulting data frame by subject and activity, then all columns are averaged across the resulting group combinations into 'average_values'

The resulting table is written to samsung_data.txt
