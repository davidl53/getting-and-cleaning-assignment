# getting-and-cleaning-assignment

This is an assignment as part of the coursera "Getting and Cleaning Data" Course

The tidydata file was produced from the combined training and test dataset by the run_analysis.R file.

The code runs with the working directory set to the folder containing both the "test" and "train" folders.

The combined dataset was produced by using cbind to add the subject ("subject_test" and "subject_train") and activity files("y-test" and "y-train") columns to the main data files ("X_test " and "X_train"). 
Descriptive variable nmes were added to the first 2 columns of each file
The descriptive names for the remainder of the columns were added to each file from "features.txt". In retrospect this step could hve been left until after combination of the 2 sets, and would only need one step.
rbind was used to merge the 2 sets of data.
The columns were selected by including those variables with names including "mean" or "std" but excluding "meanFreq". (This was simply an exercise in subsetting. I do not know if there was good reason to exclude the "meanFreq" columns) A vector of these column numbers was created, the first 2 columns added, and the vector used to subset the dataset.
The numerical activity codes were replaced with the descriptive ones from "activity_labels.txt"

The tidydata contains one variable per column and one observation per row. 

The Codebook is not fully completed as I do not know exactly what each of the variables represent.


