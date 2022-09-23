#!/bin/bash

nvidia-docker run \
  --name mlnotebook --rm  \
  -v "$(pwd):/src" \
  -p 8888:8888 \
  mlnotebook
