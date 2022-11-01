#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s
kubectl -n ingress-nginx patch svc ingress-nginx-controller -p '{"spec":{"type":"LoadBalancer"}}'
kubectl -n ingress-nginx replace -f ingress-nginx-controller-cm.yaml
kubectl -n ingress-nginx delete pod --all
