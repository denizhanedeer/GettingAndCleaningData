x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
##================================================##
x_data <- rbind(x_train,x_test)
y_data <- rbind(y_train,y_test)
subject_data <- rbind(subject_train,subject_test)

## ===============================================##

features <- read.table("features.txt")

mean_std_feat <- grep("-(mean||std)\\()",features[,2])

x_data <- x_data[,mean_std_feat]

names(x_data) <- features[mean_std_feat,2]

## ===============================================##

activity <- read.table("activity_labels.txt")

y_data[,1] <- activity[y_data[,1],2]

names(y_data) <-"activity"

## =============================================##

names(subject_data) <- "subject"

data <- cbind(x_data,y_data,subject_data)



