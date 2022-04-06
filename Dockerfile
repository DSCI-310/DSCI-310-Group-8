FROM ubcdsci/jupyterlab:v0.9.0

# Install Jupyter, JupterLab, R & the IRkernel
# Packages and versions specificed in environment.yml
#COPY environment.yml .
#RUN conda env update --file environment.yml
ADD environment.yml environment.yml
RUN conda env create -f environment.yml
# Pull the environment name out of the environment.yml
RUN echo "source activate $(head -1 environment.yml | cut -d' ' -f2)" > ~/.bashrc
ENV PATH /opt/conda/envs/$(head -1 denvironment.yml | cut -d' ' -f2)/bin:$PATH