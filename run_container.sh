#!/usr/bin/env bash

shopt -s expand_aliases
source ~/.bash_aliases

docker run -itd \
  --mount type=bind,source="$(pwd)",target=/home/coq/coq_tutorial/ \
  zeuamsa/sf_dev:latest
