#!/bin/bash

# Install ansible
sudo apt-get update -y
sudo apt-get install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible
sudo apt-get install -y python python-pip
ansible --version

# Configure environment for ansible local provision
sudo apt-get install -y git
pip install pip --upgrade
pip install ansible --upgrade

# Install aws cli v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install