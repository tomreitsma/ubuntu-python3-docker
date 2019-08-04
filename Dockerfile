# Slim python3 image based on ubuntu

FROM ubuntu:latest
MAINTAINER Tom Reitsma "tom@triton-it.nl"

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && ln -s /usr/bin/python3 /usr/local/bin/python \
  && pip3 install --upgrade pip

ENTRYPOINT ["python"]
