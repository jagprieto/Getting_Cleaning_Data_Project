Getting and Cleaning Data. Project assigment. Code book
========================================================

Summary :
--------------------------------------------------------
- The script generates a first version of the tidy data set that contains 180 rows and 68 columns.
- The final result data is a melted version of the first version that contains 11880 and 4 columns.
- The first two columns indicate the subject and the activity.
- The rest of the columns contains the variable names and MEAN VALUES obtained from the selected feature meassures grouped by user and activity. 
- The information in the final result is ordered in rows by feature, user and activity.

Data dictionary :
-------------------------------------------------------
- [Column 1] SubjectId : The identification assigned to each subject in the experiment.
- [Column 2] Activity : The activity that the user performs.
- [Column 3] variable : This column keep the label related to each one of the meassured features. Each label
is generated with a four digit code in the form: 
                                  T.O.S.M. 
, that allows us to identify the feature related to the variable value as follows:

  T. : This code indicates the Type of signal:
    * tB -> tBody : Information related to the body acceleration signals.
    * tG -> tGravity : Information related to the gravity acceleration signals.
    * fB -> fBody : Information related to Fast Fourier Transform of the body acceleration signals.
    
  O. : This code indicates the Origin of the signal:
    * a -> Acc : The signal comes from the accelerometer.
    * g -> Gyro : The signal comes from the gyroscope.
    * aj -> AccJerk : The signal comes from the Jerk signals derived in time from the accelerometer.
    * gj -> GyroJerk : The signal comes from the Jerk signals derived in time from the gyroscope.
    
  S. : This code indicates the kind of Statistical meassure:
    * m -> Mean : The meassures are statistical mean value.
    * s -> Std : The meassures are statistical std value.
    
  M. : This code indicates the Magnitude related to the meassure:
    * X : The meassures are values related to the X axis.
    * Y : The meassures are values related to the Y axis.
    * Z : The meassures are values related to the Z axis.
    * Mag : The meassures are values related to magnitudes computed using the Euclidean norm.
    
    
  Examples :
  - tB.a.s.X -> tBodyAcc-mean()-X : Meassure related to the body aceleration, obtained with the accelerometer,
                the numerical data is std statistical meassure and the magnitude is associated to the axis X.
  

  - tB.aj.m.Mag > tBodyAccJerkMag-mean() : Meassure related to the body aceleration, obtained with the Jerk signals derived from the accelerometer,
                 the numerical data is the mean statistical meassure and the magnitude is associated to the euclidean norm.
                  
  - tG.a.m.Y -> tBodyAcc-mean()-X : Meassure related to the gravity aceleration, obtained with the accelerometer,
                the numerical data is the mean statistical meassure and the magnitude is associated to the axis Y.
                            
 - [Column 4] value : The MEAN VALUE for the feature linked to the variable.
    