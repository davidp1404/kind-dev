#!/bin/bash

kubectl create secret generic s3proxy \
--from-literal S3PROXY_AUTHORIZATION=aws-v2-or-v4 \
--from-literal S3PROXY_IDENTITY=demouser \
--from-literal S3PROXY_CREDENTIAL=demouser123 \
--from-literal S3PROXY_ENDPOINT=http://0.0.0.0:80 \
--from-literal LOG_LEVEL=info \
--dry-run=client -o yaml > s3proxy-secret.yaml
