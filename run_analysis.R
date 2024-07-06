## Tidy Data

# Load training data

x_train <- read.table("./dataset/train/X_train.txt")
y_train <- read.table("./dataset/train/y_train.txt")
subject_train <- read.table("./dataset/train/subject_train.txt")

# Load test data

x_test <- read.table("./dataset/test/X_test.txt")
y_test <- read.table("./dataset/test/y_test.txt")
subject_test <- read.table("./dataset/test/subject_test.txt")

# Merge data

x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Remove partial data

rm(list= ls()[ endsWith(ls(), "train") ])
rm(list= ls()[ endsWith(ls(), "test") ])

# Extract mean and standard deviation

features <- read.table("./dataset/features.txt")

mean_indexes <- grep("mean\\(", features$V2)
mean_labels <- grep("mean\\(", features$V2, value=TRUE)

x_mean <-  x[mean_indexes]
colnames(x_mean) <- mean_labels

std_indexes <- grep("std", features$V2)
std_labels <- grep("std", features$V2, value=TRUE)

x_std <-  x[std_indexes]
colnames(x_std) <- std_labels

# Add labels and merge

subject <- as.factor(subject$V1)

activity_names_data <- read.table("./dataset/activity_labels.txt")
activity_names <- activity_names_data$V2

labeled_activities <- apply(y, MARGIN = 1, FUN = function(x){activity_names[x]})
labeled_activities <- factor(labeled_activities)

selected_data <- cbind(subject, labeled_activities, x_mean, x_std)

# Average over each subject and activity 
library(dplyr)

selected_data <- group_by(selected_data, subject, labeled_activities)

average_values <- summarize(selected_data, across(everything(), mean))

write.table(average_values, "samsung_data.txt", row.names=FALSE)