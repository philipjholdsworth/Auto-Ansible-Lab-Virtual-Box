#!/usr/bin/env bash
#This script creates your ansible lab and presents it in a fully setup ready to use state

#Create and provision VM's
vagrant up

# Save the vagrant config to a file to allow for non vagrant ssh
vagrant ssh-config > vagrant-ssh

# Ssh to the controller VM and run key_gen.sh
ssh -F vagrant-ssh controller LocalCommand="sudo bash /home/vagrant/key_gen.sh"
exit
