FROM ubcdsci/jupyterlab:v0.9.0

# Install Jupyter, JupterLab, R & the IRkernel
# Packages and versions specificed in environment.yml
COPY environment.yml .
#RUN conda env update --file environment.yml

# Create the environment 
Run conda env create --file environment.yml

# Activate the environment
Run conda activate group8
