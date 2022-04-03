# Exam Performance Predictor
## DSCI 310 Group 8

## Group members

Contributors: 
- Isabela Lucas Bruxellas (33569286)
- Tony Liang (39356993)
- Xue Wang (50938547)
- Anam Hira (67844266)

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
2- Open the terminal and run the following in the terminal

```
docker run -p 8888:8888 -v /$(pwd):/opt/notebooks anamhira47/group8project
```
Warning: If after running this code you get a message saying that the port is already being allocated, simply change the 8888 BEFORE the colon to any other 4 digit number.

### Cloning in the Jupyterlab GUI

3- Open up a web browser provided in your terminal and access JupyterLab. Ensure that you are in the root directory of your computer. 

4- Navigate to the git buttom (diamond shape) on the left side menu bar and click on "Clone a Repository". 

5- Click on the green code buttom of the repository - https://github.com/DSCI-310/DSCI-310-Group-8 -  and copy the HTTPS link there. 

6- Paste that into the clone repository on Jupyterlab 

### Alternative ways to run the analysis 

To clone this repository in the terminal command line follow the instructions provided here: https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository

To clone this repository without a docker. First, clone the repository and locally install all dependencies listed. 

### Making the file 

7- Navigate to the root of the project and run the following command

```
make all
```

8- Remove all of the files created by that (such as the results folder), run the following

```
make clean
```

## Dependencies
R version 4.1.1, Jupyter and R packages listed in <code>environment.yml
</code>

## License
This project is licensed under the MIT License and [Creative Commons Attribution-NonCommerical-NoDerivatives 4.0 International License](https://creativecommons.org/licenses/by-nc-nd/4.0/)
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:1" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />

