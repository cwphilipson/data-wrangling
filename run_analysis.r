#Summary: This script creates a tidy data set for human activity from a publically available smartphone data set
#Data: UCI Machine Learning Repository - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#Contributor(s) to code: Casandra Philipson
#Version 1.0
#January 2016

#Set up important libraries
library(readr) #for getting data into R
library(dplyr) #for functions
library(tidyr) #for tidying up data

#Import Data and Label
#/test_data.txt data merging
features <- read.table("features.txt", quote="\"", comment.char = "")
features_list <- features[,2] #get all names from 2nd column; use as X_test colnames
features_list <- make.names(features_list, unique = TRUE, allow_ = TRUE) #set all columns to have unique names

X_test <- read.table("X_test.txt", quote="\"", comment.char = "")
names(X_test) <- features_list #add column names
y_test <-read.table("y_test.txt", quote="\"", comment.char = "")
names(y_test) <- "ActivityLabel"  #add column names
subject_test <- read.table("subject_test.txt", quote="\"", comment.char = "")
names(subject_test) <- "SubjectID"  #add column names

DATA_test <- dplyr::bind_cols(subject_test, y_test, X_test) #combine all test data

#/train_data.txt data merging
X_train <- read.table("X_train.txt", quote="\"", comment.char = "")
names(X_train) <- features_list #add column names
y_train <-read.table("y_train.txt", quote="\"", comment.char = "")
names(y_train) <- "ActivityLabel"  #add column names
subject_train <- read.table("subject_train.txt", quote="\"", comment.char = "")
names(subject_train) <- "SubjectID"  #add column names

DATA_train <- dplyr::bind_cols(subject_train, y_train, X_train) #combine all train data
  
#Merge Datasets
DATA_all <- dplyr::bind_rows(list(DATA_test, DATA_train))

#Extract columns of interest: features containing mean and standard deviation
DATA_mean_std <- DATA_all %>%
  select(matches("SubjectID|ActivityLabel|ActivityName|mean()|std()")) %>%
  select(-matches("Freq|angle"))

#Create New Variable: Identify correct ActvityLabel (numeric #1-6) with ActivityName
DATA_mean_std <- within(DATA_mean_std, ActivityName <- factor(DATA_mean_std$ActivityLabel,
          labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")))

#Create a new tidy dataset with averages based on subject and activity
DATA_all_tidy <- DATA_mean_std %>%
  group_by(SubjectID, ActivityLabel, ActivityName) %>%
  summarise_each(funs(mean(., na.rm=TRUE)))


write.csv(DATA_all_tidy, file = "SmartPhone_Tidy.csv", sep = ",", col.names = NA)
