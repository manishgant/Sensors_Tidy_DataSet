##Tidy Data-set from Samsung Phone's accelerometer readings
========================================================
1. Unzip the source ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )
   into a folder on your local drive, say C:\Users\yourname\Documents\R\

2. Put run_analysis.R to C:\Users\yourname\Documents\R\UCI HAR Dataset\
   in RStudio: setwd("C:\\Users\\yourname\\Documents\\R\\UCI HAR Dataset\\")
   and then: source("run_analysis.R")

3. The latter will run the R script, it will read the dataset and write these files: tidy_dataset.txt

4. The script normally runs for 5 to 10 seconds, but the exact number depends on your system.

5. Use data <- read.table("tidy_dataset.txt") to read the latter. It is 180x68 because there are 30 subjects and 6 activities,     thus "for each activity and each subject" means 30*6=180 rows. Note that the provided R script has no assumptions on numbers    of records, only on locations of files.
