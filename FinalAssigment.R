###Install any package if necessary
library(dplyr)
library(tibble)
library (reshape2)


####Download file####
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "~/R/G&CData_Course_Project.zip")

#Unzip 
unzip("G&CData_Course_Project.zip")


###### Step 1: Obtaining one single data #######

#####Extracting the general data
activitylabels <- read.table("~/R/UCI HAR Dataset/activity_labels.txt", 
                             header=FALSE)
features <- read.table("~/R/UCI HAR Dataset/features.txt", 
                       header=FALSE)
features <- features [,2]


######Extracting the test data
testsubjects <- read.table("~/R/UCI HAR Dataset/test/subject_test.txt", 
                           header=FALSE)
testlabels <- read.table("~/R/UCI HAR Dataset/test/y_test.txt", 
                         header=FALSE)
testset <- read.table("~/R/UCI HAR Dataset/test/X_test.txt", 
                      header=FALSE)

##Giving names to the columns
colnames (testset) <- features
colnames(testsubjects) <- "subject"
colnames(testlabels)<- "activity"

##Combining the test data
testdf <- cbind(testsubjects,testlabels,testset)

##Cleaning the space
rm("testlabels","testset","testsubjects")


######Extracting the training data
trainsubjects <- read.table("~/R/UCI HAR Dataset/train/subject_train.txt", 
                           header=FALSE)
trainlabels <- read.table("~/R/UCI HAR Dataset/train/y_train.txt", 
                         header=FALSE)
trainset <- read.table("~/R/UCI HAR Dataset/train/X_train.txt", 
                      header=FALSE)

###Giving names to the columns
colnames(trainset) <- features
colnames(trainsubjects) <- "subject" 
colnames(trainlabels)<- "activity"

###Combining the train data
traindf <- cbind(trainsubjects,trainlabels,trainset)

###Cleaning the space
rm("trainlabels","trainset","trainsubjects")


#####Combining the final rows
uhrdf <- rbind.data.frame(testdf,traindf)


##### Step 2: Extracting the mean and std for each measurement #####

uhr_mean_std_df <- select(uhrdf, 1:2, all_of(grep("mean[^Freq]()|std()", 
                                             colnames(uhrdf))))


##### Step 3: Giving descriptive names #####

##Giving the names to the columns to merge the data 
colnames(activitylabels) <- c("activity", "activityname")

##Merge the data and reorder
uhr_activity_names <- merge(uhr_mean_std_df, activitylabels, all.x = TRUE) 
uhr_activity_names <- select(uhr_activity_names, 2,69,3:68)


##### Step 4: labels the data set ####
## This step has been already completed in the step 1, when I put the names to
## each respective set. So, the data, has been labeled

uhr_activity_names [1:6,1:5]


##### Step 5: Obtaining a Independent Tidy Data ######

##Melting the data by its variables
uhr_melt <- melt(uhr_activity_names, id.vars=c("subject","activityname"),
                 measure.vars = 3:68)

##Obtaining a tbl data frame
uhr_tbldf <- as_tibble(uhr_melt)

##Grouping the data by variable, subject, and activity
by_variable_subject_activity <- group_by(uhr_tbldf,variable,subject,activityname)

###Obtaining the tidy data
tidydata <- summarise(by_variable_subject_activity, average = mean(value))
tidydata <- ungroup(tidydata)

###Writing the file
write.table(tidydata, "~/R/TidyData_G&CData_FA.txt", row.names = FALSE)