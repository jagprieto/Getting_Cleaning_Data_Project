Getting and Cleaning Data. Project assigment. Code book
========================================================

Summary :
--------------------------------------------------------
- The tidy data set contains 180 rows and 68 columns. 
- The first two columns indicate the subject and the activity.
- The rest of the columns contains the MEAN VALUE for the selected feature meassures grouped by user and activity. 
- The information is ordered in rows by user (so we can easy examine the data for one user) 
and by activity (therefore the activities are always ordered in the same way for all the users).

Data dictionary :
-------------------------------------------------------
- [Column 1] SubjectId : The identification assigned to each subject in the experiment.
- [Column 2] Activity : The activity that the user performs.
- [Columns 3 to 68] Features mean values : This columns keep the value of the MEAN VALUE
for all the features meassurements related to the same user and activity. Each column
is labeled with a four digit code in the form: 
                                  A.B.C.D. 
, that allows us to identify the feature related to the numerical value as follows:

  A. : This code indicates the type of signal:
    * tB -> tBody : Information related to the body acceleration signals.
    * tG -> tGravity : Information related to the gravity acceleration signals.
    * fB -> fBody : Information related to Fast Fourier Transform of the body acceleration signals.
    
  B. : This code indicates the origin of the signal:
    * a -> Acc : The signal comes from the accelerometer.
    * g -> Gyro : The signal comes from the gyroscope.
    * aj -> AccJerk : The signal comes from the Jerk signals derived in time from the accelerometer.
    * gj -> GyroJerk : The signal comes from the Jerk signals derived in time from the gyroscope.
    
  C. : This code indicates the kind of statistical meassure:
    * m -> Mean : The meassures are statistical mean value.
    * s -> Std : The meassures are statistical std value.
    
  D. : This code indicates the magnitude related to the meassure:
    * X : The meassures are values related to the X axis.
    * Y : The meassures are values related to the Y axis.
    * Z : The meassures are values related to the Z axis.
    * Mag : The meassures are values related to magnitudes computed using the Euclidean norm.
    
    
    