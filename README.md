# Read Me

This file will allow me to explain how I collect, extract and transform the given data to present a cleaned, tidy data set for you; as a part of the Final Project for the Getting and Cleaning Data Course by John Hopkins University at Coursera.

NOTE: I'm not a native English speaker and as I've been how to program and I also learning how to speak your language. I'm very sorry for any misspelling or any bad use of any term. Please, help me to improve and comment any suggestion you have.

## Loading the necessary libraries

First, we need to load the libraries to complete this exercise. Install any, if necessary.

```{r}
library(dplyr)

library(tibble)

library (reshape2) 

```

## Download and extracting the files

Second, download the data and unzip the file.

```{r}
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "~/R/G&CData_Course_Project.zip")

#Unzip 
unzip("G&CData_Course_Project.zip")

```

This is going to create an «UCI HAR Dataset» directory. Inside, there will be a README, features, features_info and activity_labels txt files; with a train and test directory. These last directories contain the observations we want.

## Step 1: Obtaining one single data

First, extract the general data and record them in some variables in our global environment.

```{r}
activitylabels <- read.table("~/R/UCI HAR Dataset/activity_labels.txt", 
                             header=FALSE)

features <- read.table("~/R/UCI HAR Dataset/features.txt", 
                       header=FALSE)
features <- features [,2]
```

Second, create a single data frame containing all the information by the test subjects.

```{r}
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

```

Now, analogously to the last step, create a dataframe to the train subjects.

```{r}
trainsubjects <- read.table("~/R/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
trainlabels <- read.table("~/R/UCI HAR Dataset/train/y_train.txt",    header=FALSE)
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

```

At this point, we have two dataframes: `testdf` and `traindf`. To obtain one single data, bind their rows as follows:

```{r}
uhrdf <- rbind.data.frame(testdf,traindf)

dim(uhrdf)

```

`uhrdf` is a dataframe which contains 10,299 observations from 563 variables. All the information recollected by the researchers.

## Step 2: Extracting the mean and std for each measurement

In the step 2, they ask us the mean and standard deviation for each measurement. So, it's necessary to extract that information as follows:

```{r}
uhr_mean_std_df <- select(uhrdf, 1:2, all_of(grep("mean[^Freq]()|std()", colnames(uhrdf))))

colnames(uhr_mean_std_df)

```

As we have already gave their respective name to the columns of the data, it was easy to extract the data with the `grep` function.

## Step 3: Giving descriptive names to the activities

To achieve the substitution of each number for its each name, we are going to merge the data with the `activitylabels` table. But before it's necessary to give their appropriate name to the columns of this table:

```{r}
colnames(activitylabels) <- c("activity", "activityname")

```

Now, use the `merge` function to replace the number for each name and the `select` function to order the columns of the new data.

```{r}
uhr_activity_names <- merge(uhr_mean_std_df, activitylabels, all.x = TRUE) 
uhr_activity_names <- select(uhr_activity_names, 2,69,3:68)

uhr_activity_names [1:6, 1:5]

```

## Step 4: Labels the data set

This step has been already completed in the step 1, when the names were given to each respective column of the set. So, the data at this point has been labeled.

## Step 5: Obtaining a Independent Tidy Data

First, let's create a narrow data that allow us to recompile each measurement in a single column through the `melt` function as follows.

```{r}

uhr_melt <- melt(uhr_activity_names, id.vars=c("subject","activityname"), measure.vars = 3:68)

dim(uhr_melt)
```

This is the same data, but now we have, in just four columns, all the same observations as before. Now, it's time to group this new data by variable, subject and activity as follows:

```{r}
#First, we need to transform the data to a tbl form 
uhr_tbldf <- as_tibble(uhr_melt)

##Grouping the data by variable, subject, and activity
by_variable_subject_activity <- group_by(uhr_tbldf,variable,subject,activityname)

```

With the data grouped as before, now we just need to use the `summarise` to obtain a tidy data with *the average of each variable for each activity and each subject.*

```{r}
tidydata <- summarise(by_variable_subject_activity, average = mean(value))
tidydata <- ungroup(tidydata)
```

Finally, it's time to write this new data in a `.txt` file and complete this project:

```{r}
write.table(tidydata, "~/R/TidyData_G&CData_FA.txt", row.names = FALSE)
```

## Conclusion

It's difficult to know if this is what have been expecting for *tidy data with the average of each variable for each activity and each subject,* but I think this data could be helpful to do some superficial analysis of the data. I hope you have enjoyed my explanation and, any comment to improve my coding or English level, it would be very helpful to me.
