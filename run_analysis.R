library(plyr)

dataFile <- "data.zip"
if(!file.exists(dataFile)) {
  file.create("data.zip")
  dataUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(url = dataUrl, destfile = dataFile, method ="curl")
  unzip(dataFile) 
}


subjectData <- rbind(read.table("UCI HAR Dataset/train/subject_train.txt"), read.table("UCI HAR Dataset/test/subject_test.txt"))
features <- read.table("UCI HAR Dataset/features.txt")
meanStandardFeatures <- grep("-(mean|std)\\(\\)", features[, 2])

xData <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"), read.table("UCI HAR Dataset/test/X_test.txt"))
xData <- xData[, meanStandardFeatures]
names(xData) <- features[meanStandardFeatures, 2]
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

yData <- rbind(read.table("UCI HAR Dataset/train/y_train.txt"), read.table("UCI HAR Dataset/test/y_test.txt"))
yData[, 1] <- activities[yData[, 1], 2]
names(yData) <- "activity"
names(subjectData) <- "subject"

completeData <- cbind(xData, yData, subjectData)
write.table(ddply(completeData, .(subject, activity), function(x) colMeans(x[, 1:66])), "avaregeData.txt", row.name=FALSE)