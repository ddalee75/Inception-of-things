#!/bin/sh
#installer les logiciels necessaires dans Ubuntu 20.04



echo "installing curl..."
#install curl 
sudo apt install -y curl

echo "installing docker..."
#download docker (https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)
curl -fsSL https://get.docker.com -o get-docker.sh
#install docker
sudo sh ./get-docker.sh

echo "installing kubectl..."
#download kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo "installing k3d..."
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash


