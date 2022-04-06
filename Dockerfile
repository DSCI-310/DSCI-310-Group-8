FROM ubcdsci/jupyterlab:v0.9.0

# Install Jupyter, JupterLab, R & the IRkernel
# Packages and versions specificed in environment.yml
ADD environment.yml environment.yml
RUN conda env create -f environment.yml
# Activate conda environment on startup
RUN conda env create --force -f environment.yml
RUN echo "conda activate group8" >> ~/.profile