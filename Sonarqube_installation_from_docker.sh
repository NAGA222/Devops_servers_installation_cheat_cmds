#docker installtion
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-key fingerprint 0EBFCD88
sudo apt-get update
#To install latest version
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world

#sonarqube installation
docker run -d -p 9000:9000 sonarqube:lts

#default username: admin
#default password: admin