#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

echo "START - install gitlab - "$IP

echo "[1]: install gitlab"

#echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections

#sudo locale-gen --purge en_US.UTF-8
#sudo sh -c 'echo "LANG=en_US.UTF-8\nLANGUAGE=en_US.UTF-8\nLC_ALL=en_US.UTF-8\nLC_CTYPE=en_US.UTF-8" > /etc/default/locale'
#echo "export LANGUAGE=en_US.UTF-8\nexport LANG=en_US.UTF-8\nexport LC_ALL=en_US.UTF-8\nexport LC_CTYPE=en_US.UTF-8">>~/.bash_profile

sudo apt-get update -qq >/dev/null 
# -qq = 
# Quit; produit une sortie adaptée à la journalisation, en omettant la progression indicateurs. 
# Plus de q produiront plus de silence jusqu'à un maximum de 2. (=-qq)

sudo apt-get install -qq -y vim git wget curl >/dev/null
sudo curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash 
sudo apt-get update -qq >/dev/null

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
#set a locale non-interactively
#https://serverfault.com/questions/362903/how-do-you-set-a-locale-non-interactively-on-debian-ubuntu

sudo apt install -y gitlab-ce
sudo sed -i 's|external_url \x27http://gitlab.example.com\x27|external_url \x27http://'"$IP"\x27|g' /etc/gitlab/gitlab.rb 
sudo gitlab-ctl reconfigure 
encho "END - install gitlab"

#sudo dpkg-reconfigure locales