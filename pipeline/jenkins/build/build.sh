#!/bin/bash

# Copy the new jar to the build location
cp -f java-app/target/*.jar jenkins/build/

echo "**************************"
echo "*** Build docker image ***"
echo "**************************"

cd jenkins/build/ && docker-compose -f docker-compose.yml build --no-cache