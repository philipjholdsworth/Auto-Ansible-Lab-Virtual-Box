#!/usr/bin/env bash

# THIS SCRIPT WILL CREATE SSH KEYPAIR AND DISTRIBUTE ACROSS ALL NODES

ssh-keygen -b 2048 -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""

# LOOPING THROUGH AND DISTRIBUTING THE KEY

for val in controller managed1 managed2; do
	echo "-------------------- COPYING KEY TO ${val^^} NODE ------------------------------"
	sshpass -p 'vagrant' ssh-copy-id -o "StrictHostKeyChecking=no" vagrant@$val
done

# CREATE THE INVENTORY FILE

PROJECT_DIRECTORY="/home/vagrant/ansible_project/"

mkdir -p $PROJECT_DIRECTORY
cd $PROJECT_DIRECTORY

# Creating the inventory file for all 3 nodes to run some adhoc command.

echo -e "controller\n\n[ubuntu1]\nmanaged1\n\n[ubuntu2]\nmanaged2" > inventory
echo -e "[defaults]\ninventory = inventory" > ansible.cfg
echo -e "-------------------- RUNNING ANSBILE ADHOC COMMAND - UPTIME ------------------------------"
echo

# running ansible command to see if the VM's can be accessed via an invetory

echo
ansible all -i inventory -m "shell" -a "uptime"
echo

# Updating the hosts file for all the 3 nodes with the IP given in vagrantfile

# 192.168.10.3 controller.ansible.com controller
# 192.168.10.4 managed1.ansible.com managed1
# 192.168.10.5 managed2.ansible.com managed2

echo -e "192.168.10.3 controller.anslab.com controller\n192.168.10.4 managed1.anslab.com managed1\n192.168.10.5 managed2.anslab.com managed2" >> /home/vagrant/ansible_project/hosts

# running ansible command to see if the VM's can be pinged

cd /home/vagrant/ansible_project
ansible all -m ping

#echo ---
#echo ---------------------------------------------------------------
#echo

#echo "Your Ansible lab enviroment has been successfully created"
#echo "controller - 192.168.10.3 - controller.ansible.com"
#echo "managed1 - 192.168.10.4 - managed1.ansible.com"
#echo "managed2 - 192.168.10.5 - managed2.ansible.com"
