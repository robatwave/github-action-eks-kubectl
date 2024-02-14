#!/bin/sh
export PATH=$PATH:/root/.local/bin:/usr/local/bin
set -e
echo "$KUBE_CONFIG_DATA"
if [ ! -d ~/.kube ]; then
  mkdir ~/.kube
fi
echo "$KUBE_CONFIG_DATA" | base64 --decode > ~/.kube/config
export KUBECONFIG=~/.kube/config
export t=`aws --version`
if [ ! -d ~/.aws ]; then
  mkdir ~/.aws
fi
echo [default] > ~/.aws/credentials
echo aws_access_key_id = "$AWS_ACCESS_KEY_ID" >> ~/.aws/credentials
echo aws_secret_access_key = $"$AWS_SECRET_ACCESS_KEY" >> ~/.aws/credentials
echo $t
echo "ACCESS KEY ID"
cat ~/.aws/credentials
kubectl rollout restart deployment $1 --kubeconfig ~/.kube/config
