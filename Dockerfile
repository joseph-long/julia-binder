
# Based on Dockerfile copyrighted by the Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/datascience-notebook

# Enable conda-forge package list
RUN conda config --add channels conda-forge

ENV EXTRA_PACKAGES astropy
RUN conda install --yes $EXTRA_PACKAGES && \
    conda clean -tipsy

# Copy notebooks into place
# (n.b. This must be last because otherwise Dockerfile edits
# invalidate the build cache)
COPY . $HOME
