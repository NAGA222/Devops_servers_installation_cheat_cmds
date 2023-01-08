AWS-EC2-Ubuntu -2cpu*4GB Memory Instance


hostname Node
exec bash
sudo apt update
sudo apt -y install curl apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni
sudo apt-mark hold kubelet kubeadm kubectl
kubectl version --client && kubeadm version
sudo swapoff -a
sudo modprobe br_netfilter
sudo sysctl net.bridge.bridge-nf-call-iptables=1
sudo apt update
sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y containerd.io docker-ce docker-ce-cli
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo tee /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

sudo systemctl daemon-reload
sudo systemctl reload docker
sudo systemctl enable docker

kubeadm join 172.31.40.5:6443 --token 506q9x.ww4191pzojsjp50i         --discovery-token-ca-cert-hash sha256:e32b2e465fdb13a3f3cf42679a99e2357d8948cc5422909e027307127715cb65
rm /etc/containerd/config.toml
systemctl restart containerd

kubeadm join 172.31.40.5:6443 --token 506q9x.ww4191pzojsjp50i         --discovery-token-ca-cert-hash sha256:e32b2e465fdb13a3f3cf42679a99e2357d8948cc5422909e027307127715cb65
history
