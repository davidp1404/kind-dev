#!/bin/bash

curl -sLo ./kind "https://kind.sigs.k8s.io/dl/v0.16.0/kind-$(uname)-amd64"
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
grep -qxF 'source <(kind completion bash)' ~/.bashrc || echo 'source <(kind completion bash)' >> ~/.bashrc

kind create cluster --config kind-config.json

# Set limits for resources
docker update kind-worker --cpus 2 --memory 4G --memory-swap 4G
docker update kind-worker2 --cpus 2 --memory 4G --memory-swap 4G
docker update kind-worker3 --cpus 2 --memory 4G --memory-swap 4G
kubectl label nodes kind-worker kind-worker2 kind-worker3 node-role.kubernetes.io/worker=worker
