
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

<b>Part 1 : K3s and Vagrant</b>

• Set up 2 machines with Vagrantfile.
• The hostname of the first machine must be followed by the capital letter S (like Server). The hostname of the second machine must be followed by SW (like ServerWorker).

• Have a dedicated IP on the eth1 interface. The IP of the first machine (Server) will be 192.168.42.110, and the IP of the second machine (ServerWorker) will be 192.168.42.111

• Be able to connect with SSH on both machines with no password.

• Be able to connect with SSH on both machines with no password.

• Install K3s on both machines:
- In the first one (Server), it will be installed in controller mode.
- In the second one (ServerWorker), in agent mode.

• Install kubectl<br><br>



<b>Part 2 : K3s and three simple applications</b><br>
![IOTPart2](https://user-images.githubusercontent.com/92326016/202915428-8e1e5efd-3d23-4011-9b1d-95342d33ee1c.png)
<br><br>
• Set up 3 web applications of your choice that will run in your K3s instance. <br>
• Be able to access them depending on the HOST used when making a request to the IP address 192.168.42.110.<br>
• When a client inputs the ip 192.168.42.110 in his web browser with the HOST app1.com, the server must display the app1. When the HOST app2.com is used, the server must dis- play the app2. Otherwise, the app3 will be selected by default.<br><br>
• Result when the virtual machine is correctly configured:<br>

![IOTPart2-1](https://user-images.githubusercontent.com/92326016/202915552-3a136ad9-1984-4af9-83ee-ce86a48babfb.png)



<br><br>

<h5>Part 3 : K3d and Argo CD , Git Hub</h5> <br>
• Install K3D on your virtual machine. <br>
• Write a script to install every necessary packages and tools. <br>
• Set up a small infrastructure (CD CI) following the logic illustrated by the diagram below:

![IOTPART3](https://user-images.githubusercontent.com/92326016/202915581-4824aca7-6ea2-4d29-b42a-db2cfe4ca370.png)

<br><br>
• Have to create two namespaces:<br>
  - The first one will be dedicated to Argo CD.<br>
  - The second one will be named dev and will contain an application. This application will be automatically deployed by Argo CD using your online Github repository.<br>
• The application that will be deployed must have two different versions<br>
• Must be able to change the version from your public Github repository, then check that the application has been correctly updated.<br><br>



<b>Bonus Part : K3d and Argo CD , Git Lab</b><br>
• Add Gitlab in the lab you did in Part 3.<br>
• Your Gitlab instance must run locally.<br>
• Configure Gitlab to make it work with your cluster.<br>
• Create a dedicated namespace named gitlab.<br>
• Everything you did in Part 3 must work with your local Gitlab.<br>




