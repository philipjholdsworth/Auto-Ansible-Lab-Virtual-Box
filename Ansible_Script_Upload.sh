#!/usr/bin/env bash
#This script allows for playbook uploads to the Controller VM
vagrant ssh-config > vagrant-ssh
scp -F vagrant-ssh Playbooks/Reboot_IF_Required.yml Playbooks/Linux_Reboot.yml Playbooks/Ping_All.yml controller:/home/vagrant/ansible_project
exit
