#!/bin/bash

export INSTALL_K3S_EXEC="--node-ip=192.168.42.111 --flannel-iface=eth1 --node-external-ip=192.168.42.111"
export K3S_URL=https://192.168.42.110:6443
export K3S_TOKEN_FILE="vagrant/node-token"


echo "K3S: Downloading and installing...in Worker node"
curl -sfL https://get.k3s.io | sh -

echo "Downloading and Installing ifconfig tool...in Worker node"
sudo yum install net-tools -y

echo "[Worker: $(hostname)] has been setup succefully!"

