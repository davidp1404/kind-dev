#!/bin/bash

curl -sLo ./kind https://kind.sigs.k8s.io/dl/v0.16.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
grep -qxF 'source <(kind complete bash)' ~/.bash_aliases || echo 'source <(kind complete bash)' >> ~/.bash_aliases
