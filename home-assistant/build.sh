#!/bin/bash
docker build -t molobrakos/home-assistant:base -f Dockerfile.base .
docker build -t molobrakos/home-assistant .
docker build -t molobrakos/home-assistant:dev -f Dockerfile.dev .
