# Code Book

* Human activity data is obtained from accelerometers from a Samsung Galaxy S smartphone.
* six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
* 3-axial linear acceleration and 3-axial angular velocity using the accelerometer and gyroscope 
* Randomly partitioned into test and training sets
* Features were extracted from the data, such as mean and standard deviation

## Used files

'train/subject_train.txt': subject id for training data
'test/subject_test.txt:  subject id for testing data
'features.txt': Names of features
'activity_labels.txt': Names of activities 
'train/X_train.txt': Training data.
'train/y_train.txt': Training activity label
'test/X_test.txt': Testing data
'test/y_test.txt': Testing activity label

## Variables

x - feature data
y - activity data
features - feature names
selected_data - mean and standard deviation features combined with subject and activity id
average_values - final averaged features across groups

## Process

Features are read into 'x_train', 'x_test', 'y_train', and 'y_test'
Features are merged by row into 'x' and 'y'

Subjects are read into 'subject_train' and 'subject_test', and merged into 'subject'

Feaure names are read into 'features'

The indexes and values of the mean and standard deviation features are extracted with grep
(The search term is "mean(" for the former to filter out meanFreq)

The names are added as column names

The indexes are used to extract the relevant columns from 'x'

The activity ids are replaced by the names from 'features.txt'

The relevant columns are merged with the subject and activity ids

dplyr is used to group the resulting data frame by subject and activity, then all columns are averaged across the resulting group combinations into 'average_values'

The resulting table is written to samsung_data.txt
