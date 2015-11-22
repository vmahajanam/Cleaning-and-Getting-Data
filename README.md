###Cleaning and Getting Data course project code book

The script, Run_analysis.R reads-in the training and test experiment data and generates a tidy data file containing the average of the measurements on features with mean and standard deviation

The tidy data file containing the average of measurement is generated in following steps:

1. Read the feature and activity files (into seperate data tables)
2. Extract only the features on the mean and standard deviationn from the features file
3. Read the test data (X_test), test labels (y_test) and subject data (subject_test) respective data tables. (Note: Each row in subject_test identifies the subject who performed the activity)
4. Name the columns of X_test with the feature names from features.txt file.
5. From the test data extract only the measurements on the mean and standard deviation for each measurement.
6. Attach the respective activity name to the activity id in the label data set y_test
7. Merge the following three data tables containing 
    1. Test data containing only measurements on mean and standard deviation 
    2. Labels data 
    3. subject-id
8. Steps 3 through is again performed on files containing training data 
9. Now merge Test and Training data (i.e merge the outputs of steps 7 & 8)
10. The data from step 9 is then grouped by subject and activity by using melt function
11. The average is calculated for every measurement column by using dcast function and written into an output file tidy_data.txt

Each line in Run_analysis.R is commented. Reference the file for more information on this process.
