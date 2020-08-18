# Cleaning-UCI-HAR-Dataset
This project consists of obtaining and cleaning  Human Activity Recognition data from the UC Irvine Machine Learning Repository. It is undertaken as the peer-graded assignment for Coursera's Getting and Cleaning Data course.

## Data 
Multiple text files relating to tri-axial sensor signal (accelerometer and gyroscope) readings obtained from 30 volunteers performing various activities (walking, walking upstairs, walking downstairs, sitting, standing and laying) while wearing a smartphone (Samsung Galaxy S II) on the waist. 

## Objective 
To collect the data from the web and prepare it for analysis i.e. perform merges, select or drop variables, renaming variables et cetera. 


## Deliverables Include: 
<ul>
  <li><code><b>run_analysis.R </b> </code>: an R script that collects and cleans data from the Samsung Galaxy S smartphone by:</li> 
  <ul type = "circle"><br> 
    <li>downloading and unzipping file from <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"> URL </a></li>
    <li>reading files (test and train data) into R</li> 
    <li>merging the test and train data to create single data set</li>
    <li>creating descriptive and syntactically valid variable names</li> 
    <li>creating tidy data set with the average of each variable per activity per subject</li>
    </ul type = "circle"><br>
 <li><code><b>codebook.pdf</b></code>: a code book describing the variables in the  tidy data set</li>
</ul>

## Operating Environment 
RStudio
Version 1.2.5042

