FROM ubcdsci/jupyterlab:v0.9.0

# Install Jupyter, JupterLab, R & the IRkernel
# Packages and versions specificed in environment.yml
ADD environment.yml environment.yml
RUN conda env create -f environment.yml

# install.packages('methods',dependencies=TRUE, repos='http://cran.rstudio.com/');
# Installs package repository 

RUN R -e 'install.packages("devtools", repos = "http://cran.us.r-project.org")'
RUN R -e "devtools::install_github('DSCI-310/DSCI-310-Group-8-package', force = TRUE)"
# Activate conda environment on startup

RUN echo "conda activate group8" >> ~/.profile
