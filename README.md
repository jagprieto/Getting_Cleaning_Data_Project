Getting and Cleaning Data. Project assigment.
========================================================

This project is related to the project assignment at the Getting and Cleaning Data Coursera course. The task to
develop is the data filtering from a Smartphones Data Set obtained from experimentsthat  have been carried out with a group
of 30 volunteers within an age bracket of 19-48 years in order to obtain a tidy data set that shows the MEAN VALUES
of the meassured features for each subject and type of activity.

Some notes about this project:

- The file CodeBook.md contains information about the data dictionary.

- The script run_analysis.R performs the generation of the tidy data for the selected feature meassures grouped by user and activity
and obtained from the test and train data sets.

- The script run_analysis.R contains two Dfunctions:

  read_csv_data : 
  This function reads the information from the test or the train data directories and returns a data frame with 
  the complete features data information, including the subject and the activity related to the numerical meassure.
  
  rename_features_data_labels : 
  This function rename the features data labels in order to fit the specifications in the dictionary data.

- The script run_analysis.R  is executed following the steps:
  1. Read the activity and the features data labels.
  2. Extract columns index with mean and std information, using "mean()" and "std()" as grep patterns to obtain the index data.
  3. Rename features data labels according to  the specifications in the dictionary data.
  4. Call read_csv_data to read and paste user and activity information for test and train data.
  5. Bind test and train data to generate the first tidy data set version (with 68 columns).
  6. Group the tidy data by subject and activity and compute the mean value for the numeric columns (features).
  7. Rename the tidy data columns with the renamed features labels (see CodeBook.md).
  8. Generate a melted version (4 columns) of the tidy data to be final result.
  9. Save result into a text file.
  
  