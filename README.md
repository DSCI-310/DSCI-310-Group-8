# DSCI-310-Group-8
## Group members

Contributors: 
- Isabela Lucas Bruxellas (33569286)
- Tony Liang (39356993)
- Xue Wang (50938547)
- Anam Hira (67844266)

## Project Title
Using the Regression to Predict the Student Exam Performance by Study Time

## Project Summary 
In this project, we will explore and predict students' exam performance about Electrical DC Machines based on their study time by using linear regression (LN) and the K-nearest neighbors (K-NN) algorithm.  This result could help students gain insight into the necessary study time for specific scores as well as help instructors better understand the performance of students.
 
As a result of our analysis, we have found the Root mean square prediction error(RMSPE) for our LN model to be 0.281, while the RMSPE of the K-NN model is 0.257. Both types of regression have a prediction error percentage of about 40% (therefore our accuracy is about 60%), although the K-NN model is slightly better than LN model here. 

This can be attributed to the fact that exam performance could be affected by other external factors such as health condition, student IQ, stress levels, learning ability and our data set may not be big enough to directly draw a relationship between just study time and exam performance.

The dataset we used was the User Knowledge Modeling Dataset provided by [UCL Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/User+Knowledge+Modeling#). 


## Report
The analysis report can be found [here](https://github.com/DSCI-310/DSCI-310-Group-8/blob/main/analysis/student_performance_analysis.ipynb).

## Usage(How to Run the Project)
In this project, we use a Docker container image to make the project reproducible by creating a computational environment. If you would like to run this project to reproduce our results you can reproducibly execute the project non-interactively. If you would like to collaborate on this project, you can interactively run, edit and explore the project in Jupyter Lab.

### How to run this project non-interactively 

1- Clone this GitHub repository and run the following code in the terminal

```
git clone https://github.com/DSCI-310/DSCI-310-Group-8
```
2- Open the terminal and run the following command

```
docker run --rm -p 8888:8888 -v /$(pwd):/opt/notebooks anamhira47/group8project
```
3- After the command runs, copy the last link such as

```
 http://127.0.0.1:8888/lab?token=22205c1b665b8e6ba27542800fff06e73820a5904597d336
 
```
from the terminal. Open Google Chrome and paste the link. 

4- Open the terminal on JupyterLab and run 

```
/bin/bash
```

5- Run 

```
make all
```

6- Remove all files created by the previous command and run

```
make clean
```

Attention: The dependencies version have been listed below. In order to properly run this project, ensure that you are using the same versions when running the project in the Dockerfile.

## Dependencies
R version 4.1.1, Jupyter and R packages listed in <code>environment.yml
</code>

## License
This project is licensed under the MIT License and [Creative Commons Attribution-NonCommerical-NoDerivatives 4.0 International License](https://creativecommons.org/licenses/by-nc-nd/4.0/)
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:1" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />

