#!/bin/sh
export PATH=$PATH:/root/.local/bin:/usr/local/bin

aws eks update-kubeconfig --name "$EKS_CLUSTER_NAME"
arg=$1
files=( "${@:2}" )

echo "arguments: $arg ${files[*]}"
kubectl $1 ${files[*]}
