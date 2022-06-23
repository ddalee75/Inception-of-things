#!/bin/bash

export TOKEN_FILE = "vagrant/scripts/node-token"
export INSTALL_K3S_EXEC="--node-ip=#{WORKER_IP} --flannel-iface=eth1 --node-external-ip=#{WORKER_IP}"
export K3S_URL=https://#{MASTER_IP}:6443

echo "K3S: Downloading and installing...in Worker node"
curl -sfL https://get.k3s.io | sh -

echo "Downloading and Installing ifconfig tool...in Worker node"
sudo yum install net-tools -y

echo "[Worker: $(hostname)] has been setup succefully!"

