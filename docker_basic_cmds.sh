sudo -i

yum install docker -y
docker version

//Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?

systemctl start docker
systemctl status docker
docker version
docker images

//REPOSITORY   TAG       IMAGE ID   CREATED   SIZE

docker search amazonlinux

docker pull amazonlinux
//to download image

docker images
//to list the images
//REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
  amazonlinux   latest    9727a5ee20e1   6 weeks ago   144MB

lsblk
du -sh
//its to analyse the how data consume in server

docker run -it --name cont1 amazonlinux
//to create container
yum install git -y
yum install maven -y

docker ps
//to see running containers
docker ps -a
//to see all containers
docker stop cont1
//to stop cont1
docker ps
docker start cont1
docker ps
docker kill cont1
//to stop immediatly cont1-"container"

service docker start
service docker status

-----------------------------------------------------------------------------------------------------------------------------------------
OS LEVEL VIRTUALIZATION:

Note:
Redhat      :      yum
ubuntu      :      apt

without running apt update -y we can't install packages

Working:
docker pull ubuntu
docker images
docker run -it --name cont1 ubuntu
apt update -y
// ubuntu doen't need yum 

apt install git maven apache2 tree -y
//install all the packages

docker ps -a
touch file{1..5}
ls

docker images
docker ps -a
docker commit cont1 yuvan
docker run -it --name cont2 yuvan


Docker File:
its way to creating images automatically.
we can reuse the docker file for multiple times
in Dockerfile D will be capital always
components inside the dockerfile also capital


Dockerfile  -->  Image  -->  Container   -->   repeate


Components:
           FROM                 :         to base image   (gives os)
           RUN                  :         to execute linux commands (image creation)
           CMD                  :         to execute linux comands  (container creation)
           COPY                 :         to copy local files to container
           ADD                  :         to copy internet files to container
           WORKDIR              :         to go desired folder
           LABEL                :         to attach our tags/labels
           ENV                  :         variables which run inside container (image)
           ARGS                 :         variables which run outside containers (containers)
           VOLUME               :         used to create volume for container
           EXPOSE               :         used to give port number

           
ex:1
vim dockerfile
docker build -t netflix

FROM ubuntu
RUN apt update -y
RUN apt install git maven tree apache2 -y
CMD apt install default-jre -y

Build   :   docker build -t netflix:v1
const   :   docker run -it --name cont3 netflix:v1



vim dockerfile
FROM ubuntu
RUN apt update -y
RUN apt install git maven tree apache2 -y
CMD apt install default-jre -y



docker build -t netflix:v2
docker run -it --name cont4 netflix:v2
docker ps -a


ex:2
vim dockerfile

FROM ubuntu
RUN apt update -y
RUN apt install git maven tree apache2 -y
COPY index.html /tmp
ADD https://dlcdn.apache.org/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz /tmp
WORKDIR /tmp
LABEL author yuvanth
ENV client swiggy
VOLUME ["/volume1"]
EXPOSE 8080

docker run -it --name cont2 netflix:v2

run commands inside container

docker build -t netflix:v2 .

vim index.html
docker build -t netflix:v2 .


Build   :   docker build -t netflix:v2
const   :   docker run -it --name cont3 netflix:v2 


---------------------------------------------------------------------------------------------------------------------------------------
DOCKER - VOLUME:

Method-01

Docker ubuntu
VOLUME ["/volume1"]

docker build -t netflix:v1 .
docker run -it --name cont1 netflix:v1
cd volume1
touch fike{1..10}

docker run -it --name cont2 --volumes-from cont1 --privileged=true ubuntu
cd colume1
ll


Method-02

docker run -it --name cont3 -v / volume2 ubuntu
ll
cd volume2
touch java{1..10}

docker run -it --name const4 from cont3 --privileged=true ubuntu
ll


Method-03

VOLUME MOUNTING:

volume commands
docker volume create volume1
docker volume ls
docker volume inspect volume1

cd/var/lib/docker/volumes/volume2/_data
touch python{1..10}
ll

docker run -it --name cont2 --mount source=volume3,destination=/volume3 ubuntu

cd volume3/
ll


docker volume create volume4
docker volume ls
docker volume inspect volume4
cd/var/lib/docker/volumes/volume4/_data
touch php{1..10}

docker run -it --name cont5--mount source=volume4,destination/@ubuntu

method -04: Moving Files from local to container:

create a container and attach a volume for it

touch yuvan{1..10}
docker inspect cont6
docker volume inspect volume4
cp * /var/lib/docker/volume4/_data
ll

method-05:

docker run -it --name cont7 -v /root=/abc ubuntu
ll

docker run -it --name cont8 -v / root=abc ubuntu
//translate one container to another container

docker run -it --name cont9 -v /abc ubuntu
//create a volume for abc

docker run -it --name cont12 -v /home/ec2-user:abcd ubuntu


SYSTEM COMMANDS:

docker system df
//to show the docker components resource utilization

docker system df -v
//to show the docker components resource utilization individually


docker pull centos

docker pull amazonlinux
docker system prune
//to remove unused docker components
y
docker kill $(docker ps -a -q)

docker network create yuvan
docker network create yuvan2
//to create a network
docker system prune
y
docker system events

docker run -it --name cont1 -p 8080:8080 jenkins/jenkins:lts
// jenkins setup using this singke command


---------------------------------------------------------------------------------------------------------------------------------------
vim dockerfile

FROM ubuntu
RUN apt update -y
RUN apt install apache2 -y
COPY index.html /var/www/html
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

create index.html

docker build -t movies:v1 .
docker run -itd --name movies -p 81:80 movies:v1

1.index.html (movies)
docker build -t movies:v1 .
docker run -itd --name movies -p 81:80 movies:v1
public-ip:81

2.index.html (movies = train)
docker build -t train:v1 .
docker run -itd --name train -p 82:80 train:v1
public-ip:82

3.index.html (train = dth)
docker build -t dth:v1 .
docker run -itd --name dth -p 83:80 dth:v1
public-ip:83

4.index.html (dth = recharge)
docker build -t recharge:v1 .
docker run -itd --name recharge -p 84:80 recharge:v1
public-ip:84


DOCKER COMPOSE:
Its a tool used to launch multiple containers.
we can create multiple containers on single hosts.
All of the services information we are going to write on a file.
Here we use docker-compose/compose file.
It will be on yaml format.
we use key-value pair (dictionary) (.yml or .yaml)




sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
ls /usr/local/bin/
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version



-----------------------------------------------------------------------------------------------------------------------------------------


sudo -i

yum install docker -y

vim dockerfile

FROM ubuntu
RUN apt update -y
RUN apt install apache2 -y
COPY index.html /var/www/html
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

docker login
//username & password    

vim index.html

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

.icon {
  padding: 10px;
  background: dodgerblue;
  color: white;
  min-width: 50px;
  text-align: center;
}

.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid dodgerblue;
}

/* Set a style for the submit button */
.btn {
  background-color: dodgerblue;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}
</style>
</head>
<body>

<form action="/action_page.php" style="max-width:500px;margin:auto">
  <h2>PATYM MOVIES</h2>
  <div class="input-container">
    <i class="fa fa-user icon"></i>
    <input class="input-field" type="text" placeholder="Username" name="usrnm">
  </div>

  <div class="input-container">
    <i class="fa fa-envelope icon"></i>
    <input class="input-field" type="text" placeholder="Email" name="email">
  </div>
  
  <div class="input-container">
    <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="Password" name="psw">
  </div>

  <button type="submit" class="btn">Register</button>
</form>

</body>
</html>

docker build -t train:v1 .
docker tag train:v1 yuvansai13/train
docker push yuvansai13/train
//repositary had been added automatically
------------------------------------------------------------------------------------------------------------------------------------
DOCKER SWARM:

high avaliability: deploying app on more than one server means using the cluster.
docker swarm is an container orchestration tool.
it is used ti manage multiple containers on multiple nodes
each node will have a copy of single container.
here we have manager and worker nodes.
manager node will create containers and send to worker nodes.
worker nodes will take the container and manage them.



docker rmi -f $(docker images -q)
//to remove all the images are present in docker

SET-UP:
create 3 servers (1=manager 2=worker) (all traffic is must)
install docker and set the hostnames

hostnamectl sethostname manager
hostnamectl sethostname worker-1
hostnamectl sethostname worker-2

manager node: docker swarm init
copy the token to all worker nodes

docker service ls                    : to list services
docker service ps train              : to list containers for train
docker service inspect train         : to get complete info of train service
docker service scale train=10        : to scale the services
docker service scale train=6         : to scale the services
docker service rollback train        : to back to previous state
docker service rm train              : to scale the services


SELF HEALING: automatically recreates container itself

CLUSTER LEVEL ACTIVITIES
docker swarm leave(worker node) : to down the worker noe


--------------------------------------------------------------------------------------------------------------------------------------------------------------------


Docker Project:






