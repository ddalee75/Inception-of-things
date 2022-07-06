#!/bin/sh
# uninstall curl, docker, kubectl, k3d...

#uninstall docker
echo "\nuninstalling docker..."
sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce 
#echo "removing all docker's files... "
#sudo rm -rf /var/lib/docker /etc/docker
#sudo rm /etc/apparmor.d/docker
#sudo groupdel docker
#sudo rm -rf /var/run/docker.sock
echo "docker unstalled"

# uninstall curl
echo "\nuninstalling curl"
sudo apt-get remove curl -y
echo "curl unstalled"

# uninstall k3d and kubectl
echo "\nuninstalling k3d and kubectl..."
sudo rm -rf /usr/local/bin/k3d
sudo rm -rf /usr/local/bin/kubectl
echo "done"