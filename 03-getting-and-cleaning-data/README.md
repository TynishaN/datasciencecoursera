# Getting and Cleaning Data - Course Project

## Project Title
*Smartphone-Based Human Activity Recognition: Data Cleaning and Tidying Project*

## Overview
This project is part of the Coursera Getting and Cleaning Data course. It uses accelerometer and gyroscope data collected from Samsung Galaxy smartphones to recognize different human activities. The objective is to clean and reshape this raw dataset into a tidy format that makes it easier to analyze.

## Files Included
- run_analysis.R: The R script that reads, merges, cleans, and transforms the data.
- tidy_dataset.txt: The final tidy dataset containing averages of selected measurements.
- CodeBook.md: A document explaining the dataset structure and transformations.

## Steps Performed in run_analysis.R
1. Load libraries (data.table, dplyr)
2. Read feature and activity label files
3. Load and label test and train datasets
4. Merge datasets into one combined set
5. Extract only measurements related to *mean* and *standard deviation*
6. Replace activity codes with descriptive names
7. Rename variables with readable and descriptive names
8. Create a second tidy dataset with the average of each variable for each subject-activity pair
9. Export the tidy dataset to tidy_dataset.txt

## Running the Analysis
To run the script:
1. Ensure all dataset files from the UCI HAR Dataset are in your local machine.
2. Run the script run_analysis.R in R or RStudio.
3. The output file tidy_dataset.txt will be created in your working directory.

## Dataset Source
[UCI Machine Learning Repository - Human Activity Recognition Using Smartphones Dataset](https://archive.ics.uci.edu/ml/datasets/human+activity+recognition+using+smartphones)

## Author
Tynisha Niles