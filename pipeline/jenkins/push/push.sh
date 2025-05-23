#!/bin/bash

echo "*********************************"
echo "*** Push Image ******************"
echo "*********************************"

IMAGE="maven-001"

echo "*** Docker Login ***"
docker login -u 21072022 -p $PASS

echo "*** Tagging Image ***"
docker tag $IMAGE:$BUILD_TAG 21072022/$IMAGE:$BUILD_TAG

echo "*** Pushing Image ***"
docker push 21072022/$IMAGE:$BUILD_TAG
