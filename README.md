# run_analysis.R

Coursera Getting and Cleaning the Data , Final Project

In the codebook, firstly, I uploaded X_train, y_train and subject_train datasets and X_test, y_test, subject_test datasets subsequently to my RStudio with read.table() function 

After, features dataset were uploaded to RStudio. X_train and X_test datasets were merged and y_train and y_test datasets were binded and labels component were added for the excel table and the same process were applied to subject datasets 

And colnames were determined. 
I used grep / grepl function because this function matches the exact charachters and returns to the logical vector. 
Then I created dataframe and Subject & Activity were determined as two columns. 
Activity names also uploaded to my RStudio

for text analysis, I uploaded the qdapTools package and I used it and the data turned to txt.file lastly thanks to the writexl package. 
And uploaded file is tidy data 
