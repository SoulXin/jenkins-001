#!/bin/bash

echo maven-001 > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i ~/.ssh/prod /tmp/.auth prod-user@3.85.129.89:/tmp/.auth
scp -i ~/.ssh/prod ./jenkins/deploy/publish.sh prod-user@3.85.129.89:/tmp/publish
ssh -i ~/.ssh/prod prod-user@3.85.129.89 "/tmp/publish"


