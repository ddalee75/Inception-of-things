#!/bin/bash

export TOKEN_FILE = "vagrant/scripts/node-token"
export INSTALL_K3S_EXEC="agent --server https://$1:6443 --token-file $TOKE
N_FILE --node-ip=$2"


echo "K3S: Downloading and installing...in Worker node"
curl -sfL https://get.k3s.io | sh -

echo "Downloading and Installing ifconfig tool...in Worker node"
sudo yum install net-tools -y

echo "[Worker: $(hostname)] has been setup succefully!"

