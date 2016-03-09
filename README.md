# data-wrangling-
[Foundations in data science] Making tidy data sets

=========================================================================
README
=========================================================================
Data Wrangling: UCI Smartphone Data for Human Activity Recognition  
Version 1.0  
author: Casandra Philipson  
date: January 26, 2016  
=========================================================================

### Instructions
Obtain the Samsung Galaxy S Smartphone Dataset from UCI and perform the following:  
1.  Merge all data (test and training) into one data set  
2.  Label observations and data features  
3.  Extract data of interest (mean and standard deviation measurements) 

=========================================================================

### Data Source
This project was performed using the Samsung Galaxy S Smartphone Dataset available at UCI. 
See a full description of the dataset at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
=========================================================================

### Description of run_analysis.r code:
Human activity recognition data obtained from the UCI Samsung Galaxy S Smartphone dataset is provided by several files. 

The run_analysis.r code performs the following steps:
	•	Set up appropriate libraries  
	•	Import and label data   
	•	Merge feature names, subject IDs, and activity labels to data for both test and training datasets  
	•	Merge data from test and training datasets  
	•	Extract columns of interest (features containing mean and standard deviation measurements)  
	•	Labels activity with name (i.e. walking, walking_upstairs…”)  
	•	Makes a second, independent, tidy data set containing the averages of each variable for each activity and subject  
	•	Saves tidy dataset as a cvs file named “SmartPhone_Tidy”  
