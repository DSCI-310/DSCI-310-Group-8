FROM ubcdsci/jupyterlab:v0.9.0

# # Install Jupyter, JupterLab, R & the IRkernel
# # Packages and versions specificed in environment.yml
# ADD environment.yml environment.yml
# RUN conda env create -f environment.yml

# # install.packages('methods',dependencies=TRUE, repos='http://cran.rstudio.com/');
# # Installs package repository 

# RUN R -e 'install.packages("devtools", repos = "http://cran.us.r-project.org")'
# RUN R -e "devtools::install_github('DSCI-310/DSCI-310-Group-8-package', force = TRUE)"
# # Activate conda environment on startup

# RUN echo "conda activate group8" >> ~/.profile

RUN conda install --yes -c conda-forge\
    r-bookdown=0.25 \  
    r-cowplot=1.1.1 \ 
    r-docopt=0.7.1 \
    r-devtools=2.4.3 \
    r-GGally=2.1.2 \ 
    r-kknn=1.3.1 \
    r-knitr=1.37 \
    r-reshape=0.8.8 \
    r-repr=1.1.4 \
    r-shiny=1.7.1 \
    r-tidyverse=1.3.1 \
    r-tidymodels=0.1.4 \




