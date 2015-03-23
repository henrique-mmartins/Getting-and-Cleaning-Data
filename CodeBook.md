{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww15280\viewh17980\viewkind0
\deftab720
\pard\pardeftab720

\f0\fs24 \cf0 R script called run_analysis.R was created to do the following.\
\
## Step 1. Merges the training and the test sets to create one data set.\
x_train.txt\
\
y_train.txt\
\
subject_train.txt\
\
were loaded into R with read.table()\
\
x_test.txt\
\
y_test.txt\
\
subject_test.txt\
\
were loaded into R with read.table()\
\
x_data\
\
y_data\
\
subject_data\
\
were combined with rbind()\
\
## Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. \
features.txt \
was loaded into R with read.table()\
columns with "mean" or "std" in their names were extraced with grep()\
\
## Step 3. Uses descriptive activity names to name the activities in the data set\
activity_labels.txt \
\
was loaded into R with read.table()\
\
activity labels were assigned to y_data\
\
## Step 4. Appropriately labels the data set with descriptive variable names. \
subject_data was labeled as "subject"\
\
x_data\
\
y_data\
\
subject_data\
\
were combined into one single data set with cbind()\
\
##Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.\
the average of each variable for each activity and each subject were exacted with aggregate()\
\
tidy_data.txt was created with write.table()\
}