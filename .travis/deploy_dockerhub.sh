#!/bin/sh
docker login -u $DOCKER_USERNAME -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t "linus747/cicd-buzz":$TAG .
sudo docker push "linus747/cicd-buzz":$TAG