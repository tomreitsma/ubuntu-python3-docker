# Slim python3 image based on ubuntu

FROM ubuntu:latest
MAINTAINER Tom Reitsma "tom@triton-it.nl"

ARG python_version=3.7.3

RUN apt-get update \
  && apt-get install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget \
  && cd /usr/src \
  && wget https://www.python.org/ftp/python/$python_version/Python-$python_version.tar.xz \
  && tar -xf Python-$python_version.tar.xz \
  && cd Python-$python_version \
  && ./configure --enable-optimizations \
  && make -j`nproc` \
  && make altinstall \
  && ln -s /usr/local/bin/python3.7 /usr/bin/python \
  && python -m pip install --upgrade pip

RUN ["python"]
