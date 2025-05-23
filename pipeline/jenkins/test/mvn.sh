#!/bin/bash

echo "*************************"
echo "*** Testing the code ********"
echo "*************************"

WORKSPACE=/var/www/html/jenkins/workspace/pipeline-maven-001

docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:latest "$@"