#!/bin/bash

sudo yum update -y

#For maven install
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo

sudo yum install -y amazon-linux-extras
sudo yum install php git mysql httpd -y
sudo yum install docker
sudo yum install -y apache-maven

#Confirming version
mvn –version

sudo amazon-linux-extras install java-openjdk11 -y

cd /home/ec2-user 
wget https://get.jenkins.io/war-stable/2.346.3/jenkins.war

#Start Jenkins
nohup java -jar jenkins.war --httpPort=8000 1> jenkins.log 2>&1 & 

