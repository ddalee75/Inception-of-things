#!/bin/sh
# create cluster and run service 

# Create a cluster, mapping the ingress port 80(container) to localhost:8080
# -p, --port [HOST:][HOSTPORT:]CONTAINERPORT[/PROTOCOL][@NODEFILTER]
# et 8888 to 30888 nodeport of application
 
echo "creating cluster..."
sudo k3d cluster create -p 8080:80@loadbalancer -p 8888:30888@loadbalancer
sleep 5

echo "creating namespaces..."
sudo kubectl create namespace argocd
sudo kubectl create namespace dev
sleep 3

echo "installing argocd"
sudo kubectl apply -n argocd -f ../confs/install.yaml
sleep 3


#echo "waiting the pods to be ready"
#sudo kubectl wait -n argocd --for=condition=Ready pods --all
#sleep 3

echo "deploy ingress of argocd..."
sudo kubectl apply -f ../confs/ingress.yaml -n argocd
sleep 3


echo "changing defautl password"
#bcrypt(password)=$2a$10$rRyBsGSHK6.uc8fntPwVIuLVHgsAhAX7TcdrqW/RADU0uh7CaChLa
sudo kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2a$10$rRyBsGSHK6.uc8fntPwVIuLVHgsAhAX7TcdrqW/RADU0uh7CaChLa",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'
sleep 3

echo "installing project to argocd"
sudo kubectl apply -f ../confs/project.yaml -n argocd
echo "installed project to argocd"
sleep 3

echo "installing application to argocd"
sudo kubectl apply -f ../confs/application.yaml -n argocd
sleep 3

echo "Done" 