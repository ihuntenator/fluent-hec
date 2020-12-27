#!/usr/bin/env bash

set -xv

TAG=${1}

VERSION=$(cat VERSION)
docker build --no-cache --pull --build-arg VERSION=${VERSION} -t ihuntenator/fluentd-hec:${TAG} ./docker

docker push ihuntenator/fluentd-hec:${TAG}
