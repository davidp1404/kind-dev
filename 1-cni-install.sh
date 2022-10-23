helm repo add cilium https://helm.cilium.io/
helm repo update cilium
docker pull cilium/cilium:v1.11.10
kind load docker-image cilium/cilium:v1.11.10
helm install cilium cilium/cilium --version 1.11.10 \
   --namespace kube-system \
   --set nodeinit.enabled=true \
   --set kubeProxyReplacement=partial \
   --set hostServices.enabled=false \
   --set externalIPs.enabled=true \
   --set nodePort.enabled=true \
   --set hostPort.enabled=true \
   --set bpf.masquerade=false \
   --set image.pullPolicy=IfNotPresent \
   --set ipam.mode=kubernetes
