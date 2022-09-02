# Keras-Docker
#### _A part of the blog - How to make models available to the Public_
[Docker Image build CI](https://github.com/suvadityamuk/KerasDocker/actions/workflows/docker-build.yaml/badge.svg)

## Introduction

This repository contains code to create a simple Model using the Keras Functional API using the pre-trained MobileNetV2 image from `keras.applications` for inference on random images from the ImageNet classes. The Dockerfile present can be used to create an image and deploy the same as a Docker container for simpler use. 

## How to build using Docker

```bash
$ docker build . -t keras-docker-trial
$ docker run -d --publish 5000:5000 keras-docker-trial
```

The first line builds the Docker image using the Dockerfile  
The second line uses the image to create a container according to the specifications and publish the port 5000 of the container to port 5000 of the local machine. 