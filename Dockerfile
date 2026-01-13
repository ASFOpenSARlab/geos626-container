FROM ghcr.io/asfopensarlab/deployment-opensarlab-container_sar:sha-fc3f9bf

RUN curl https://raw.githubusercontent.com/uafgeoteach/GEOS626_seis/37e71a8ca7e242b62700c6fb43fd3bb7a273908d/setup/seismo.yml -o /tmp/seismo.yml

RUN mamba env create -f /tmp/seismo.yml &&\
    /opt/conda/envs/seismo/bin/python -m ipykernel install --prefix /opt/conda/envs/seismo --name "seismo" --display-name "seismo" &&\
    rm -rf /opt/conda/pkgs/cache
