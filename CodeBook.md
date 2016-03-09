=========================================================================
CodeBook
=========================================================================
Data Wrangling: UCI Smartphone Data for Human Activity Recognition
Version 1.0
author: Casandra Philipson
date: January 26, 2016
=========================================================================

### Description of data files (see references [1] and [2]):
	•	'X_train.txt' : data from training set  
	•	'y_train.txt' : train labels  
	•	'subject_train.txt' : each row identifies subject that performed the activity   
	•	'X_test.txt' : data from test set  
	•	'y_test.txt' : test labels  
	•	'subject_test.txt' : each row identifies subject that performed the activity  
	•	'features.txt' : list of all features  
	•	'activity_labels.txt' : links class labels with activity name  

=========================================================================

### Variables (for each record) (adopted from reference [2]):
	•	Triaxial acceleration from accelerometer (total acceleration) and estimated body acceleration
	•	Triaxial Angular velocity from gyroscope
	•	A 561-feature vector with time and frequency domain variables.
	•	Respective activity labels
	•	An identifier of the subject who carried out the experiment.

=========================================================================

### Transformations:
	•	For each data set (test and train), data was combined with subjects, features, and activity labels (DATA_test and DATA_train)
	•	Training and test data set rows were combined using original source files into DATA_all
	•	Columns containing mean and standard deviation measurements were extracted into DATA_mean_std
	•	features_list was used to name levels of Activity label
	•	Features/Columns were renamed to be unique
	•	Data was averaged by activity and subject for the final tidy data set DATA_all_tidy

=========================================================================

### References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
[2] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

