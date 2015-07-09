#!/bin/bash

echo "Installing Ansible..."
#apt-get install -y software-properties-common
#apt-add-repository ppa:ansible/ansible
#apt-get update
#apt-get install -y ansible
sed -i "s/mirrorlist=https/mirrorlist=http/" /etc/yum.repos.d/epel.repo
rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
yum -y update
yum -y install ansible
echo "Completed Installing Ansible."
