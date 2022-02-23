#!/bin/sh
docker login -u $DOCKER_USERNAME -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t "linusaaberg/cicd-buzz":$TAG .
sudo docker push "linusaaberg/cicd-buzz":$TAG