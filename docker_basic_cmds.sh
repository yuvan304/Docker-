sudo -I

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
//to stop immediatly cont1


