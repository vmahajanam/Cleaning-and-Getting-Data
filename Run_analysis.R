# Load: data column names
features <- read.table("./features.txt")[,2]

# Load: activity labels
activity_labels <- read.table("./activity_labels.txt")[,2]

# Extract the features on the mean and standard deviation
extract_features <- grepl("mean|std", features)

# Load and process test data.
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")


# Assign feature names to x_test data
names(X_test) = features
  
# Extract the measurements on the mean and standard deviation for each measurement in test data.
X_test = X_test[,extract_features]

# Load activity labels for test data
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Act_ID", "Act_Label")
names(subject_test) = "sub_num"

# Bind the test data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)


# Load and process Training data.
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

subject_train <- read.table("./train/subject_train.txt")
names(X_train) = features

# Extract the measurements on the mean and standard deviation for each measurement in test data.
X_train = X_train[,extract_features]

# Load activity labels for training data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Act_ID", "Act_Label")
names(subject_train) = "sub_num"

# Bind training data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge test and training data
Test_Train_data = rbind(test_data, train_data)

# Seperate the id and measure variables
id_labels   = c("sub_num", "Act_ID", "Act_Label")
data_labels = setdiff(colnames(Test_Train_data), id_labels)


# Apply melt function on Test_Train_data to stack the observations in terms of features
melt_data      = melt(Test_Train_data, id = id_labels, measure.vars = data_labels)


# Apply dcast function to calculate the mean for each feature for each combination of subject and activity.
tidy_data   = dcast(melt_data, sub_num + Act_Label ~ variable, mean)
write.table(tidy_data, file = "./tidy_data.txt")





