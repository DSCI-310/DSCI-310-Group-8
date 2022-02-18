# DSCI-310-Group-8
## Group members

Authors: 
Isabela Lucas Bruxellas (33569286),
Tony Liang (39356993),
Xue Wang (50938547),
Anam Hira (67844266)<br/>

## Project Title
Using the Regression to Predict the Student Exam Performance by Study Time


## Project Summary 
In this study, we will explore and predict students' exam performance about Electrical DC Machines bases on their study time and we are going to use the User Knowledge Modeling Dataset which was already been tidy and pre-divided into training and testing subsets.

Our project is highly related to our real life and also linked to lots of similar questions not only applied in study but also in work. We are inspired to choose the study time as one of our predictors, thus we can analyze the relationship between our study time and each student performance in order to design an effective study plan.

Before we do our analysis through our project, we believe that there will be a positive relationship between PEG and STG, since normally to assume that increasing the degree of study time will get a better result in the exam performance.

In part I, we loaded the libraries that we need for the data analysis and set the seed for maintain the work to be reproducible and make a constant in the randomness firstly and we read the data from the downloaded datafolder. Because we have calculated that the proportion of the training dataset is around 64% of overall and testing dataset is 36%, we don't need to split the data by ourselves.(Data_1 is about the trainig data and Data_2 is the testing data.

After that, we want to use the ggpair plots to have a observation of the relationshop between the predictors and response variables.It seems that there may be a relationship between STG(degree of student study time) and PEG(degree of student performance). Then we cleaned and wrangled the data that we want to use and we only kept STG and PEG these two columns.

Moreover,we found the maximums, minimums, and means by summarizing the dataset. From values from these tables, we can summarize that the values of STG and PEG are close in value and have roughly the same scale.Hence, we won't need to scale or standardize the data for linear regression.Then we have checked the total obersvations in the training dataset and there is no missing data in both training and testing dataset.

Refer back to the ggpair plot for additional visualization, we made a linear regression graph which x-axis is STG and y-axis is PEG. From the 



<br/>
## Dependencies

<br/>
## Licenses

<br/>
## How to run this project

