#!/bin/bash

helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm -n kube-system  upgrade --install metrics-server metrics-server/metrics-server -f metric-server-values.yaml
