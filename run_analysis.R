X_train <- read.table("/Users/asudeberber/Downloads/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("/Users/asudeberber/Downloads/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("/Users/asudeberber/Downloads/UCI HAR Dataset/train/subject_train.txt")

X_test <- read.table("/Users/asudeberber/Downloads/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("/Users/asudeberber/Downloads/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("/Users/asudeberber/Downloads/UCI HAR Dataset/test/subject_test.txt")

features <- read.table("/Users/asudeberber/Downloads/UCI HAR Dataset/features.txt")
mergedSets <- rbind(X_train, X_test)
mergedSets$labels <- rbind(y_train, y_test)
mergedSets$subjects <- rbind(subject_train, subject_test)
colnames(mergedSets) <- features$V2
?grepl
dataframe2 <- mergedSets[,grepl("mean()|std()", names(mergedSets))]
dataframe2 <- cbind(subjects = rbind(subject_train, subject_test), labels = rbind(y_train, y_test), dataframe2)
colnames(dataframe2)[1] <- "subject"
colnames(dataframe2)[2] <- "activity"

activity_names <- read.table("/Users/asudeberber/Downloads/UCI HAR Dataset/activity_labels.txt")

install.packages("qdapTools")
library(qdapTools)

dataframe2[,2] <- lookup(dataframe2[,2], activity_names, key.reassign = NULL,
                  missing = NA)
print(str(dataframe2))

install.packages("writexl")
library(writexl)
write_xlsx(dataframe2,"/Users/asudeberber/Downloads/UCI HAR Dataset/tidy-data.xlsx")
write.table(dataframe2,"/Users/asudeberber/Downloads/UCI HAR Dataset/tidy-data.txt", row.name=FALSE)
