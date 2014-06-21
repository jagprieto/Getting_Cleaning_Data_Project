#################### Getting and Cleaning Data. Project assigment. #################### 
# Load libraries.
library(data.table)
library(plyr)
library(reshape2)
library(MASS)

# Set working directory
setwd("/home/jagprieto/Escritorio/COURSERA/GETTING_CLEANING_DATA/ASSIGNMENT/")

# This function reads the information from the test or the train data directories and returns a data frame with 
# the complete features data information, including the subject and the activity related to the numerical meassure.
read_csv_data <- function(type, features_data_index) {
  # Read the user data for each meassurement.
  fileName <- paste("./", type, "/subject_", type, ".txt", sep="")
  subject_data <- read.table(fileName,  header=FALSE)
  names(subject_data)[1]<-"SubjectId"

  # Read the activities data for each meassurement.
  fileName <- paste("./", type, "/y_", type, ".txt", sep="")
  activities_data <- read.table(fileName,  header=FALSE)
  names(activities_data)[1]<-"ActivityId"
  activities_data$Activity <- sapply(activities_data$ActivityId, function(x){activity_data_labels$Activity[(activity_data_labels$ActivityId == x)]})
  
  # Bind user and activity data
  user_activity_data <- cbind(subject_data, activities_data)
    
  # Read the data features file.
  fileName <- paste("./", type, "/X_", type, ".txt", sep="")
  features_data <- read.table(fileName,  header=FALSE)
  names(features_data) <- features_data_labels$Feature

  # Bind user, activity and features data.
  features_data <- cbind(user_activity_data[,c("SubjectId","Activity")], features_data[, features_data_index])  
}

# This function rename the features data labels in order to fit the specifications in the dictionary data.
rename_features_data_labels <- function(features_data_labels){
  features_data_labels$Feature <- gsub("[^0-9A-Za-z///' ]", "", features_data_labels$Feature)
  
  features_data_labels$Feature <- gsub("tBody", "tB.", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("fBodyBody", "fB.", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("fBody", "fB.", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("tGravity", "tG.", features_data_labels$Feature)
  
  features_data_labels$Feature <- gsub("AccJerkMag", "aj.M", features_data_labels$Feature)  
  features_data_labels$Feature <- gsub("AccMag", "a.M", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("AccJerk", "aj.", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("Acc", "a.", features_data_labels$Feature)

  features_data_labels$Feature <- gsub("GyroJerkMag", "gj.M", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("GyroJerk", "gj.", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("GyroMag", "g.M", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("Gyro", "g.", features_data_labels$Feature)
   
  features_data_labels$Feature <- gsub("Mmean", "m.Mag", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("meanX", "m.X", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("meanY", "m.Y", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("meanZ", "m.Z", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("meanX", "m.X", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("Mstd", "s.Mag", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("stdX", "s.X", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("stdY", "s.Y", features_data_labels$Feature)
  features_data_labels$Feature <- gsub("stdZ", "s.Z", features_data_labels$Feature)

  features_data_labels  
}

# Read the activity data labels (WALKING, ...) [6]
activity_data_labels <- read.table("./activity_labels.txt", sep=" " , header=FALSE)
names(activity_data_labels)[1]<-"ActivityId"
names(activity_data_labels)[2]<-"Activity"

# Read the features data labels (BodyAcc-mean()-X, ...) [561]
features_data_labels <- read.table("./features.txt", sep=" " , header=FALSE)
names(features_data_labels)[1]<-"FeatureId"
names(features_data_labels)[2]<-"Feature"

# Extract col index with mean and std information.
features_data_index <- grep("-mean\\(\\)|-std\\(\\)", features_data_labels$Feature)

# Rename features data labels.
features_data_labels <- rename_features_data_labels(features_data_labels)

# Read test data.
test_cvs_data <- read_csv_data("test", features_data_index)

# Read train data.
train_cvs_data <- read_csv_data("train", features_data_index)

# Bind test and train data.
total_csv_data <- rbind(test_cvs_data, train_cvs_data)

# Group the tidy data by subject and activity and compute the mean value for the numeric columns.
total_csv_data_tidy <- ddply(total_csv_data, .(SubjectId, Activity), numcolwise(mean))

# Rename the tidy data columns with the renamed features labels (see CodeBook.md).
names(total_csv_data_tidy)[3:ncol(total_csv_data_tidy)]<- features_data_labels$Feature[features_data_index]

# Reshape the tidy data to fit in a four column data set.
total_csv_data_tidy <- melt(total_csv_data_tidy, id=c("SubjectId", "Activity"), measure.vars=c(features_data_labels$Feature[features_data_index]))

# Save data to file
# write.table(total_csv_data_tidy, "tidy_data.txt", sep="\t\t")
write.matrix(total_csv_data_tidy, "tidy_data.txt")
