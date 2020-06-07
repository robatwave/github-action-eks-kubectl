#!/bin/sh
export PATH=$PATH:/root/.local/bin:/usr/local/bin

set -e
echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/config
export KUBECONFIG=/tmp/config
kubectl rollout restart deployment $1
