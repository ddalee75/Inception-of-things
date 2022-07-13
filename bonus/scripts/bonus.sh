#!/bin/bash

HOST_IP=$(hostname -I | awk '{print $2}')

sudo k3d cluster edit part3 --port-add 8889:30889@loadbalancer

sudo kubectl create namespace gitlab
echo "\n----------------Bonus-----------------"
echo "\ninstalling project Bonus to argocd..."

#if grep -q HOST_IP ../confs/project.yaml; then
#    sed -i 's/HOST_IP/'"$HOST_IP"'/g' ../confs/project.yaml
#fi

sudo kubectl apply -f ../confs/project.yaml -n argocd
echo "\ninsatlled progect to argocd"
sleep 3

echo "\ninstalling application Bonus to argocd..."
#if grep -q HOST_IP ../confs/application.yaml; then
#    sed -i 's/HOST_IP/'"$HOST_IP"'/g' ../confs/application.yaml
#fi

sudo kubectl apply -f ../confs/application.yaml -n argocd
echo "\ninsatlled application to argocd"
sleep 3

echo "Done for Bonus !"