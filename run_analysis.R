## in this script we have 5 steps : 
## 1) reading and binding data from directory - rbind()
## 2) getting only mean() and std() values - grep()
## 3) subsetting data set with corrected labels - names() 
## 4) binding all data sets with corrected labels and targetted columns - cbind()
## 5) take average of targetted columns and create a new tidy data
library(plyr)

## 1 - reading / binding


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
## 2 - create a new var "mean_std_feat" that is a list of integers pointing the location of mean/std features
mean_std_feat <- grep("-(mean||std)\\()",features[,2])

## 3- subsetting and correct names
## now we need to subset x_data with the mean/std columns only by using mean_std_feat
x_data <- x_data[,mean_std_feat]
## correct names of cols by using correct names from features.txt 
names(x_data) <- features[mean_std_feat,2]

##we need activity labels 

activity <- read.table("activity_labels.txt")
## correct names of activities like 1- walking 4 - sitting etc instead of numbers only
y_data[,1] <- activity[y_data[,1],2]
## now we have a data set with names of activities and we need to correct col name 
names(y_data) <-"activity"

names(subject_data) <- "subject"

## 4- bind all data sets  

final_data <- cbind(x_data,y_data,subject_data)

## final data is a data.frame = 10299 obs. of  68 variables and we know last 2 variables are activity and subject

## 5- take average of cols and ammend to new data.frame
## we can use summarizeBy() or ddply() function each requires library 
## just quick referance http://www.cookbook-r.com/Manipulating_data/Summarizing_data/
## we will use ddply() 

average <- ddply(final_data,c("subject","activity"),function(x) colMeans(x[,1:66]))

## finally we create .txt file as ouput

write.table(average,"average.txt",row.name = F)






