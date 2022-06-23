#!/bin/bash
#export MASTER_IP = 192.168.42.110
#export WORKER_IP = 192.168.42.111
export INSTALL_K3S_EXEC="--node-ip=#{MASTER_IP} --flannel-iface=eth1 --tls-san #{MASTER_IP} --bind-address=#{MASTER_IP} --advertise-address=#{MASTER_IP} --node-external-ip=#{MASTER_IP} --write-kubeconfig-mode 644"

echo "K3S: Downloading and installing...in Master node"
curl -sfL https://get.k3s.io | sh -

echo "K3S: Copy Master token to (/vagrant/scripts/node-token)"
sudo cp /var/lib/rancher/k3s/server/node-token /vagrant/scripts/

echo "Downloading and Installing ifconfig tool...in Master node"
sudo yum install net-tools -y

echo "[Master: $(hostname)] has been setup succefully !" 
