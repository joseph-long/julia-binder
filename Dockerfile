
# Based on Dockerfile copyrighted by the Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/datascience-notebook

# Enable conda-forge package list
RUN conda config --add channels conda-forge

ENV EXTRA_PACKAGES astropy
RUN conda install --yes $EXTRA_PACKAGES && \
    conda clean -tipsy
# Add CANDELS catalog in text 
ADD https://archive.stsci.edu/pub/hlsp/candels/egs/catalogs/v1/hlsp_candels_hst_wfc3_egs-tot-multiband_f160w_v1_cat.txt $HOME/
USER root
RUN chown $NB_USER:users $HOME/hlsp_candels_hst_wfc3_egs-tot-multiband_f160w_v1_cat.txt
USER $NB_USER
# Copy notebooks into place
# (n.b. This must be last because otherwise Dockerfile edits
# invalidate the build cache)
COPY . $HOME
