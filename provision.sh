#!/bin/bash

service=$1
shift

docker run --rm \
       --user root \
       -e "OPENSHIFT_TARGET=https://38.145.33.131:8443" \
       -e "OPENSHIFT_USER=developer" \
       -e "OPENSHIFT_PASS=developer" \
       -v `pwd`/kube:/opt/apb/.kube \
       -v `pwd`/extra_vars.yaml:/tmp/extra_vars.yaml \
       tripleo-k8s-$service provision "$@"
