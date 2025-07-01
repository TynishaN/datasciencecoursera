#Read in the function in your library to get use text data as data tables
install.packages("data.table")
install.packages("dplyr")
library(data.table)
library(dplyr)
getwd()
#Read and rename the columns of features data set and activity labels
features_list <- read.table("C:/Users/tynis/OneDrive/Documents/UCI HAR Dataset/features.txt")
names(features_list) <- c("code", "features")

activity_labels <- read.table("C:/Users/tynis/OneDrive/Documents/UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("id", "activity")

#Read and rename the columns in test data
X_test <- read.table("C:/Users/tynis/OneDrive/Documents/UCI HAR Dataset//test/X_test.txt", 
                     col.names = features_list$features)
y_test<- read.table("C:/Users/tynis/OneDrive/Documents/UCI HAR Dataset/test/y_test.txt", 
                    col.names = "Id")
subject_test <- read.table("C:/Users/tynis/OneDrive/Documents/UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- c("subject")

#Read and rename the train data set
X_train <- read.table("C:/Users/tynis/OneDrive/Documents/UCI HAR Dataset/train/X_train.txt",
                      col.names = features_list$features)
y_train <- read.table("C:/Users/tynis/OneDrive/Documents/UCI HAR Dataset/train/y_train.txt",
                      col.names = "Id")
subject_train <- read.table("C:/Users/tynis/OneDrive/Documents/UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- c("subject")

#Merge the training and test data set
x_data <- rbind(X_test, X_train)
y_data <- rbind(y_test, y_train)
subject_data <- rbind(subject_test, subject_train) 

#Merge all data sets into one
merge_data <- cbind(subject_data, y_data, x_data)

#Extract only columns that include the word mean and std 
mean_std_cols <- grepl("mean\\(\\)|std\\(\\)", features_list$features)

#Assuming the first two columns are subject and activity id
extracted_cols <- merge_data[, c(T,T, mean_std_cols)]

#Use descriptive activity names for the activities in the data set
extracted_cols$Id <- activity_labels[extracted_cols$Id, 2]

#Renaming the columns to appropriate labels ofthe variables
names(extracted_cols) <- gsub("^t", "Time", names(extracted_cols))
names(extracted_cols) <- gsub("^f", "Frequency", names(extracted_cols))
names(extracted_cols) <- gsub("Acc", "Accelerometer", names(extracted_cols))
names(extracted_cols) <- gsub("Gyro", "Gyroscope", names(extracted_cols))
names(extracted_cols) <- gsub("Mag", "Magnitude", names(extracted_cols))
names(extracted_cols) <- gsub("BodyBody", "Body", names(extracted_cols))


#Create a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- extracted_cols %>%
  group_by(subject, Id) %>%
  summarise_all(list(mean))

#Uising txt file created with write.table() using row.name=FALSE to save the tidy data set as a text
write.table(tidy_data, "tidy_dataset.txt", row.name = FALSE)
