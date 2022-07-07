#!/bin/sh
#installer les logiciels necessaires dans Ubuntu 20.04



echo "installing curl..."
#install curl 
sudo apt update
sudo apt upgrade
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common


echo "installing docker..."
#download docker (https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)
sudo curl -fsSL https://get.docker.com -o get-docker.sh
#install docker
sudo sh ./get-docker.sh

echo "installing kubectl..."
#download kubectl
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

#install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo "installing k3d..."
sudo curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash


