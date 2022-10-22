#!/bin/sh

set -e

GITHUB_SHA_SHORT=$(echo $1 | cut -c1-7)
DOCKER_USERNAME=$(echo $2 | base64 -d)
DOCKER_TOKEN=$(echo $3 | base64 -d)

docker login -u $DOCKER_USERNAME -p $DOCKER_TOKEN

docker build -f Dockerfile.kubernetes -t $DOCKER_USERNAME/vue-portfolio-kubernetes:$GITHUB_SHA_SHORT .

docker push $DOCKER_USERNAME/vue-portfolio-kubernetes:$GITHUB_SHA_SHORT

docker logout
