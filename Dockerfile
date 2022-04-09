FROM ubcdsci/jupyterlab:v0.9.0

# Install Jupyter, JupterLab, R & the IRkernel
# Packages and versions specificed in environment.yml
ADD environment.yml environment.yml
RUN conda env create -f environment.yml

# Installs package repository 
RUN R -e "devtools::install_github('DSCI-310/DSCI-310-Group-8-package', force = TRUE)"
# Activate conda environment on startup
RUN echo "conda activate group8" >> ~/.profile