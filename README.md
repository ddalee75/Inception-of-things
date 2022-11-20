
![Screenshot from 2022-07-18 17-14-20](https://user-images.githubusercontent.com/92326016/179544010-5435e51d-5575-44fc-ae6e-ab6889424c5e.png)

# Inception-of-things

p1: version ok 

p2_v1_nginx : vrsion ok avec nginx + index.html perso

p2_v2_imagepaulb : version ok avec image fait par paulb (pour les 3 applications)

p3_ok : version p3 ok

veresionOk_Push : la derniere version du projet IOT valide et Push sur vosphere

Pour partie 3:
note : si l execution du script "clean.sh" 
=> apres l'insallation des environnement il faut relancer docker = "systemctl start docker"  
=> faut re-installer vagrant pour la partie bonus. 

bonus : version ok avec l adresse ip en dur

bonus_v2 : version ok l'adresse ip en variable

![headerIOT_2540x1240](https://user-images.githubusercontent.com/92326016/202913007-38a83b9f-1b4f-4cca-8b57-ddc37347d9d5.jpg)

Part 1 : K3s and Vagrant

• Set up 2 machines with Vagrantfile.
• The hostname of the first machine must be followed by the capital letter S (like Server). The hostname of the second machine must be followed by SW (like ServerWorker).

• Have a dedicated IP on the eth1 interface. The IP of the first machine (Server) will be 192.168.42.110, and the IP of the second machine (ServerWorker) will be 192.168.42.111

• Be able to connect with SSH on both machines with no password.

• Be able to connect with SSH on both machines with no password.

• Install K3s on both machines:
- In the first one (Server), it will be installed in controller mode.
- In the second one (ServerWorker), in agent mode.

• Install kubectl
