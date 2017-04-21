FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y dist-upgrade && apt-get install -y software-properties-common
RUN add-apt-repository ppa:ansible/ansible

#RUN dpkg-reconfiguer debconf

ENV BUILD_PACKAGES="ssh python-pip build-essential libssl-dev libffi-dev python-dev"

RUN apt-get clean &&\
    apt-get -y update && \
    apt-get install -y $BUILD_PACKAGES && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip
RUN pip install --upgrade awscli boto
RUN pip install ansible==1.9.6

RUN mkdir /workdir
WORKDIR /workdir
ENV DEBIAN_FRONTEND teletype

ENTRYPOINT ["ansible"]
