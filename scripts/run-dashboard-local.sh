#!/bin/bash

cd `dirname $0`
BASE=`pwd`
cd - >> /dev/null

docker run \
  --name dashboard \
  -it \
  --rm \
  -p 10080:10080 \
  -v ${BASE}/../workshop_content/workshop:/opt/app-root/workshop \
  -e TERMINAL_TAB=split \
  -e WORKSHOP_ONLY=true \
  -e USERNAME=user1 \
  -e CLUSTER_SUBDOMAIN=apps.test.example.com \
  quay.io/openshifthomeroom/workshop-dashboard:5.0.0
