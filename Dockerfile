FROM docker.io/almalinux:9

ARG PYTHON_VERSION

RUN yum update -y
RUN yum install -y wget

RUN mkdir -p /opt/miniconda3 && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -u -p /opt/miniconda3 && \
    rm -rf /tmp/miniconda.sh

RUN adduser auser
RUN groupadd zp
RUN usermod -a -G zp auser
USER auser
RUN /opt/miniconda3/bin/conda init bash && . ~/.bashrc && conda create -n testenv -y -c conda-forge root pyyaml

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
