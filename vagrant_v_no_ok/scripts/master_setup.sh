#!/bin/bash

export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san $(hostname) --node-ip $1  --bind-address=$1 --advertise-address=$1 "

echo "K3S: Downloading and installing...in Master node"
curl -sfL https://get.k3s.io | sh -

echo "K3S: Copy Master token to (/vagrant/scripts/node-token)"
sudo cp /var/lib/rancher/k3s/server/node-token /vagrant/scripts/

echo "Downloading and Installing ifconfig tool...in Master node"
sudo yum install net-tools -y

echo "[Master: $(hostname)] has been setup succefully !" 
