# CodeBook

## Dataset
*Human Activity Recognition Using Smartphones Dataset*

The original dataset contains recordings of 30 subjects performing activities while wearing a smartphone on the waist. The sensors capture accelerometer and gyroscope signals.

## Raw Data Includes:
- Accelerometer and gyroscope measurements
- Activity labels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- Subject identifiers (1 to 30)

---

## Variables in Final Tidy Dataset

1. *subject* — Numeric identifier for the subject (1 to 30)
2. *Id* — Activity name (e.g., WALKING, STANDING)
3. *All other columns* — Measurement variables capturing the average of:
   - *Time* and *Frequency* domain signals
   - *Accelerometer* and *Gyroscope* data
   - *Magnitude* and *Body* movement signals
   - Only variables involving *mean()* and *std()* were included

---

## Data Cleaning & Transformation Steps (from run_analysis.R)

1. Installed and loaded data.table and dplyr libraries.
2. Read in the features.txt and activity_labels.txt files and renamed the columns.
3. Loaded and labeled test and training datasets (X_test, y_test, subject_test, and their train equivalents).
4. Merged test and training datasets using rbind() and cbind().
5. Extracted only measurements that include *mean()* or *std()*.
6. Replaced activity codes with *descriptive activity names* from activity_labels.
7. Renamed variable names to be more descriptive using gsub():
   - t → Time
   - f → Frequency
   - Acc → Accelerometer
   - Gyro → Gyroscope
   - Mag → Magnitude
   - BodyBody → Body
8. Used group_by() and summarise_all(mean) to compute the *average of each variable* for each subject and activity.
9. Saved the final tidy dataset using write.table() with row.name = FALSE, as a text (tidy_dataset.txt)


