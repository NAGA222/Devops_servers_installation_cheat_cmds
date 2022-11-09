#java installation
sudo apt-get update
sudo apt install default-jdk
sudo javac -version

#Jenkins installtion as service on EC2 Ubuntu Server
sudo apt-get update
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
apt-get update
apt-get install jenkins -y
systemctl start jenkins
systemctl status jenkins
