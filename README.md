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

Refer back to the ggpair plot for additional visualization, we made a linear regression graph which x-axis is STG and y-axis is PEG. From the figure, there isn't a clear relationship or pattern between PEG and STG because there is neither a linear/ nonlinear nor a positive/negative relationship.


In part II, to perform the actual data analysis, we used regression to predict a student’s exam performance (PEG) based on their study time (STG). Since we were predicting a numerical value instead of a categorical value, we had to use regression to evaluate and create a prediction. From what we had seen from our exploratory data analysis, K-NN regression seemed to be the better choice as it would allow for more flexibility, but we tested both the accuracies of K-NN and linear regression, and compared them to find the best approach. We trained our regression with our training data and assessed its accuracy with our testing data. To assess the accuracy, we calculated the Root Mean Squared Prediction Error (RMSPE) of our model on the test data to see how well our model generalizes to future data. RMSPE is the square root of the difference between the observed and predicted value of the ith test observation, divided by the number of observations. This indicates how well our model is able to predict on unseen data.

To visualize our final results, we plotted our predictions as a line using geom_smooth overlaid our testing data to see the relationship between the two. The x-axis is STG, and the y-axis is PEG.

After the Regression analysis, Before performing the analysis, we had expected to find a positive, linear relationship between PEG and STG. As a student spends more time studying, they should perform better. As a result of our analysis, we have found the accuracy for our linear regression model to be 0.257, while the accuracy of our K-NN regression is 0.227 (where the range of degree is 1).

Both of these types of regression have a prediction error percentage of about 40% (therefore our accuracy is about 60%), but as discussed in 2.6, our K-NN Regression model is slightly better than our linear regression due to its higher accuracy, which is consistent with our guess in Methods. Our model has relatively low accuracy.

This was not quite what we had expected to find as the outcome of our analysis, since we initially expected to be able to observe a clearer positive relationship between STG and PEG. However, this can still be reasoned with the fact that there was already not much of a strong relationship between STG and PEG as described in Section 1.8.

As mentioned in the Introduction, we had initially believed the accuracy of our K-NN regression to be about 80%. 

In conclusion, our findings will somewhat help students assess how well they are performing in comparison to the time they are spending studying. As you spend more time studying, you may perform better, but other external factors can also come into play and affect your final results. Since it is final season, it is important to remember that although studying is extremely important, it is also crucial to take care of other things such as your physical and mental health.



<br/>
## Dependencies

<br/>
## Licenses

<br/>
## How to run this project

