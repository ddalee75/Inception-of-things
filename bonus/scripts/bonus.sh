#!/bin/bash

sudo k3d cluster edit adconsta --port-add 8889:30889@loadbalancer

sudo kubectl create namespace gitlab
echo -e "\n----------------Bonus-----------------"
echo -e "\ninstalling project Bonus to argocd..."

sudo kubectl apply -f ../confs/project.yaml -n argocd
echo -e "\ninsatlled progect to argocd"
sleep 3

echo -e "\ninstalling application Bonus to argocd..."

sudo kubectl apply -f ../confs/application.yaml -n argocd
echo -e "\ninsatlled application to argocd"
sleep 3

echo "Done for Bonus !"