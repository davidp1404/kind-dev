#!/bin/bash

# It's expected that you run a nfs-server instance in the IP set

helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm repo update
helm -n kube-system install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set nfs.server=172.18.0.1 \
    --set nfs.path=/mnt/nfs_share \
    --set storageClass.name="nfs-volumes" \
    --set storageClass.defaultClass=true

kubectl patch sc nfs-volumes --patch '{"metadata": {"annotations": {"storageclass.kubernetes.io/is-default-class": "true"}}}'
kubectl patch sc standard --patch '{"metadata": {"annotations": {"storageclass.kubernetes.io/is-default-class": "false"}}}'
