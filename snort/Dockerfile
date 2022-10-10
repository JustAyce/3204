FROM ubuntu:22.04

RUN apt-get update && apt-get -y install \
        wget \
        make \
        gcc \
        build-essential \
        bison \
        flex \
        libpcap-dev \
        libpcre3-dev \
        libdumbnet-dev \
        libluajit-5.1-dev\
        luajit \
        libssl-dev \
        libtirpc-dev \
        zlib1g-dev \
				unzip \
				python3 \
				python3-pip

# Define working directory.
WORKDIR /opt

ENV DAQ_VERSION 2.0.7
RUN wget https://www.snort.org/downloads/snort/daq-${DAQ_VERSION}.tar.gz \
    && tar xvfz daq-${DAQ_VERSION}.tar.gz \
    && cd daq-${DAQ_VERSION} \
    && ./configure; make; make install

ENV SNORT_VERSION 2.9.20
RUN wget https://www.snort.org/downloads/snort/snort-${SNORT_VERSION}.tar.gz \
    && cp /usr/include/tirpc/rpc/* /usr/include/rpc/ \
    && cp /usr/include/tirpc/netconfig.h /usr/include/ \
    && tar xvfz snort-${SNORT_VERSION}.tar.gz \
    && cd snort-${SNORT_VERSION} \
    && ./configure; make; make install

RUN ldconfig

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    /opt/snort-${SNORT_VERSION}.tar.gz /opt/daq-${DAQ_VERSION}.tar.gz

# Insert own snort rules and creating of folders
RUN mkdir -p /var/log/snort && \
    mkdir -p /usr/local/lib/snort_dynamicrules && \
    mkdir -p /etc/snort && \

# mysnortrules rules
    # cp -r /opt/rules /etc/snort/rules && \
    # Due to empty folder so mkdir
    mkdir -p /etc/snort/rules && \
    mkdir -p /etc/snort/preproc_rules && \
    mkdir -p /etc/snort/so_rules && \
    # cp -r /opt/preproc_rules /etc/snort/preproc_rules && \
    # cp -r /opt/so_rules /etc/snort/so_rules && \
    # cp -r /opt/etc /etc/snort/etc && \
    wget http://d8bd-175-156-193-95.ngrok.io/snort.conf -o /etc/snort/snort.conf

ENV RULE 'alert ip any any -> any 80 (msg:"Connecting to OUR port 80";sid: 1000005)'

RUN echo ${RULE} > /etc/snort/rules/local.rules && \
snort -A fast -c /etc/snort/snort.conf -q -i enp0s3
CMD python3 -m pip install elasticsearch
