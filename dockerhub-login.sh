#!/bin/bash


# Docker login with PAT
export dockerhub_username='nadavdev' && docker login  -u $dockerhub_username  -p  $DOCKERHUB_COI_PAT
tag='1.0.0'
docker build -t nadavdev/k8s-network-policy-demo-client-image:$tag .


# oci://registry-1.docker.io/nadavdev
kubectl create secret docker-registry regcred --docker-server='docker.io' --docker-username=$dockerhub_username --docker-password=$DOCKERHUB_COI_PAT


export pat2='dckr_pat_Ck9ofMr0K5UY7l7-eHxbLzNede0'
kubectl create secret docker-registry regcred \
 --docker-server='https://index.docker.io/v1/' \
 --docker-username=$dockerhub_username \
 --docker-password=$pat2 \
 --docker-email=nadavops@gmail.com



kubectl create secret docker-registry regcred --from-file=.dockerconfigjson --type=kubernetes.io/dockerconfigjson


kubectl create secret generic regcred \
    --from-file=.dockerconfigjson=/Users/nsalman/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson