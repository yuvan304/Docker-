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



