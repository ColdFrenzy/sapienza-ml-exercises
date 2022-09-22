#!/bin/bash

docker run \
  -v "$(pwd):/src" \
  -p 8888:8888 \
  mlnotebook
