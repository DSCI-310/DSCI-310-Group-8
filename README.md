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
In this project, we will explore and predict students' exam performance about Electrical DC Machines based on their study time by using linear regression (LN) and the K-nearest neighbors (K-NN) algorithm.  This result could help students gain insight into the necessary study time for specific scores as well as help instructors better understand the performance of students.
 
As a result of our analysis, we have found the Root mean square prediction error(RMSPE) for our LN model to be 0.281, while the RMSPE of the K-NN model is 0.257. Both types of regression have a prediction error percentage of about 40% (therefore our accuracy is about 60%), although the K-NN model is slightly better than LN model here. 

This can be attributed to the fact that exam performance could be affected by other external factors such as health condition, student IQ, stress levels, learning ability and our data set may not be big enough to directly draw a relationship between just study time and exam performance.

The dataset we used was the User Knowledge Modeling Dataset provided by [UCL Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/User+Knowledge+Modeling#). 



## Dependencies
<code> R version 4.1.1, Jupyter and R packages listed in environment.yml
</code>
## How to run this project
Clone this repository and run following code on command line to install required dependencies for this project:

```
### fill in docker run --rm -it -p 8888:8888 <workflow_insert_here>
```

## License
This project is licensed under the MIT License and [Creative Commons Attribution-NonCommerical-NoDerivatives 4.0 International License](https://creativecommons.org/licenses/by-nc-nd/4.0/)
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:1" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />

