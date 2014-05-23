setwd("C:/Users/Michael/Desktop/UCI HAR Dataset")

## read features.txt file
feature <- read.table("features.txt", header = F, stringsAsFactor = F)

## read testing set data and merge with subject column and activity column
setwd("./test")
Xtest <- read.table("X_test.txt", header=F)
Ytest <- read.table("y_test.txt", header=F)
Subtest <- read.table("subject_test.txt", header=F)
## convert numeric data to activity levels
Y <- factor(Ytest[,1], labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
## merge column in test dataset
data.test <- cbind(Subtest, Y, Xtest)

##read training dataset and merge with subject column and activity column
setwd("../train")
Xtrain <- read.table("X_train.txt", header=F)
Ytrain <- read.table("y_train.txt", header=F)
Subtrain <- read.table("subject_train.txt", header=F)
## convert numeric data to activity levels
Y_train <- factor(Ytrain[,1], labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
## merge column in test dataset
data.train <- cbind(Subtrain, Y_train, Xtrain)

## name the columns of both datasets
colnames(data.test) <- c("subject","activity", feature[,2])
colnames(data.train) <- c("subject","activity", feature[,2])

## merge two datasets
merged_data <- rbind(data.test, data.train)

## identify columns that contain mean and std
a <- grep("mean", names(merged_data))
b <- grep("std", names(merged_data))
c <- sort(c(a,b))

## extract the columns that contain mean and std of each measurement
finaldata <- merged_data[,c(1:2,c)]

## reshape the dataset with melt
library(reshape2)
meltData <- melt(finaldata, id.vars=c("subject", "activity"), measure.vars=names(finaldata)[3:81])

## extract the final data frame with dcast
report <- dcast(meltData, subject + activity ~ variable, mean)

## output the data frame to report.txt file
setwd("..")
write.table(report, "report.txt", row.names=F)
