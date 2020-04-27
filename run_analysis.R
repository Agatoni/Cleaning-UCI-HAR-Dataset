# 'Getting and Cleaning Data' Project
# By: Sarah Agatoni | On: April 27, 2020
# For: Peer-Graded Assignment, JHU Coursera


# 0. loads required packages 
if (!require("pacman")) install.packages("pacman"); library(pacman)
pacman::p_load(dplyr, data.table, janitor)


# 1. downloads and unzips file from URL 
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "~/data_archive.zip", method = "curl")
unzip("~/data_archive.zip")


# 2. read files
## activity labels 
activity_labels <- fread("./UCI HAR Dataset/activity_labels.txt", 
                  encoding = "UTF-8", 
                  col.names = c( "code", "activity")) 

## features
features <- fread("./UCI HAR Dataset/features.txt", 
                         encoding = "UTF-8", 
                         col.names = c( "record", "feature"))

## test data 
subject_test <- fread("./UCI HAR Dataset/test/subject_test.txt", 
                 encoding = "UTF-8", 
                 col.names = "id" )


activity_test <- fread("./UCI HAR Dataset/test/y_test.txt", 
                     encoding = "UTF-8", col.names = "activity")


test <- fread("./UCI HAR Dataset/test/X_test.txt", 
              encoding = "UTF-8", col.names = make_clean_names(features$feature))


test_data <- cbind(subject_test, activity_test, test)


## train data 
subject_train <- fread("./UCI HAR Dataset/train/subject_train.txt", 
                      encoding = "UTF-8", 
                      col.names = "id" )


activity_train <- fread("./UCI HAR Dataset/train/y_train.txt", 
                  encoding = "UTF-8", col.names = "activity")


train <- fread("./UCI HAR Dataset/train/X_train.txt", 
              encoding = "UTF-8", col.names = make_clean_names(features$feature))

train_data <- cbind(subject_train, activity_train, train)


# 3. merge the training and the test sets to create one data set
merged_data <- rbind (test_data, train_data)


# 4. extract only the measurements on the mean and standard deviation for each measurement
selec_data <- merged_data %>% select(contains(c("id", "activity", "mean", "std")), 
                               -contains(c("angle", "mean_freq"))) %>% arrange(id)

# 5. Use descriptive activity names to name the activities in the data set
selec_data$activity <- factor(selec_data$activity, levels = activity_labels$code, 
                          labels = make_clean_names(activity_labels$activity))

# 6. descriptive variable names
names(selec_data) <- names(selec_data) %>% 
  gsub(pattern = "^t", replacement = "time", x = .) %>% 
  {gsub("gravity", "grav", .)} %>%
  {gsub("^f_body_body", "f_body", .)} %>%
  {gsub("^f", "freq", .)} 

## code 'id' as factor 
selec_data$id <- as.factor(selec_data$id)

# 7. create independent, tidy data set with the average of each variable per activity per subject
tidy_data <- selec_data %>% group_by(id, activity) %>% summarise_all(mean)
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
