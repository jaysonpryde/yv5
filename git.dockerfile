FROM ubuntu:20.04

RUN apt-get -qq update -y && apt-get -qq install -y git \
    && rm -rf /var/lib/apt/lists/*
RUN adduser --disabled-password --gecos "" --uid 1000 --shell /bin/bash jenkins

RUN git config --global user.email jaysonpryde@gmail.com
RUN git config --global user.name "Jayson Pryde"
RUN git config --global --add safe.directory '*'
