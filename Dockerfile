FROM ubuntu:16.04

RUN apt-get -y update && apt-get -y dist-upgrade && apt-get install -y software-properties-common
RUN add-apt-repository ppa:ansible/ansible


ENV BUILD_PACKAGES="ansible ssh python-pip"

RUN apt-get clean &&\
    apt-get -y update && \
    apt-get install -y $BUILD_PACKAGES && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install --upgrade awscli boto

RUN mkdir /workdir
WORKDIR /workdir

ENTRYPOINT ["ansible"]
