#!/bin/sh
# create cluster and run service 

# Create a cluster, mapping the ingress port 80(container) to localhost:8080
# -p, --port [HOST:][HOSTPORT:]CONTAINERPORT[/PROTOCOL][@NODEFILTER]
# et 8888 to 30888 nodeport of application
 
echo "creating cluster..."
sudo k3d cluster create part3 -p 8080:80@loadbalancer 
sleep 5

echo "creating namespaces..."
sudo kubectl create namespace argocd
sudo kubectl create namespace dev
sleep 3

echo "installing argocd"
sudo kubectl apply -f ../confs/install.yaml -n argocd
sleep 3


#echo "waiting the pods to be ready"
#sudo kubectl wait -n argocd --for=condition=Ready pods --all
#sleep 3

echo "deploy ingress of argocd..."
sudo kubectl apply -f ../confs/ingress.yaml -n argocd
sleep 3

echo "recuperer le password"
echo `kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d ` > argocd-password.txt
sleep 3

# Expose method= Nodeport 
sudo kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'

echo "Done" 



