#!/bin/bash
systemctl disable firewalld --now
export INSTALL_K3S_EXEC="--node-ip=192.168.42.110 --flannel-iface=eth1 --tls-san 192.168.42.110  --bind-address=192.168.42.110 --node-external-ip=192.168.42.110 --write-kubeconfig-mode 644"

echo "K3S: Downloading and installing...in Master node"
curl -sfL https://get.k3s.io | sh -

echo "K3S: Copy Master token to (/vagrant/node-token)"
NODE_TOKEN="/var/lib/rancher/k3s/server/node-token"
cp ${NODE_TOKEN} /vagrant

echo "Downloading and Installing ifconfig tool...in Master node"
sudo yum install net-tools -y

echo "[Master: $(hostname)] has been setup succefully !" 
