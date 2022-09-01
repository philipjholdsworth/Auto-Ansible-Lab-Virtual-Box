# Windows Compatible Ansible Lab Using Vagrant And Virtualbox

This repository contains a three node ansible lab. Setup using vagrant and virtualbox as the provider. 

Host OS - Windows

## Getting Started

These instructions will help create a copy of the Ansible Lab setup on
your local machine for development and testing purposes. See deployment
for notes on deploying the project on a live system.

### Prerequisites

Requirements for the software and other tools to build, test and push 
- [Virtual Box](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)

### Installing

1. Install Vagrant & Virual Box on your hoast

2. Create a Folder in which to locate your Ansible Lab

3. Cloan the repository to this newly created folder

You are now ready to initializing the lab

## Initializing The Lab

With your chosen command line (im using Cmder - https://cmder.app/) , change directory to the folder you just created.

Now run:

    bash Ansible.Lab_Setup.sh
  
This will create the following lab enviroment:
  
|    Node Type   | Node Name             |  IP Address  | OS Flavor     |
| ---------------| --------------------- |--------------|---------------|
| Controller Node| controller.anslab.com | 192.168.10.3 | ubuntu/focal64|
| managed Node   | managed1.anslab.com   | 192.168.10.4 | ubuntu/focal64|
| managed Node   | managed2.anslab.com   | 192.168.10.5 | ubuntu/focal64|

  Controller Node - Hosts Ansible
  Managed Node(S) - Servers you want to manage
  
  Once the setup is complete you should see a successfull Ping test:
  
  -------------------- RUNNING ANSBILE ADHOC COMMAND - UPTIME ------------------------------


managed2 | CHANGED | rc=0 >>
 11:35:27 up 4 min,  1 user,  load average: 0.07, 0.26, 0.13
managed1 | CHANGED | rc=0 >>
 11:35:27 up 7 min,  1 user,  load average: 1.30, 0.35, 0.14
controller | CHANGED | rc=0 >>
 11:35:27 up 2 min,  1 user,  load average: 0.84, 0.44, 0.17

managed2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
managed1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
controller | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"

## Uploading Playbooks

On your host maching run the following:

    bash Ansible_Script_Upload.sh

To choose the playbooks you want to upload. Edit the Ansible_Script_Uplaod.sh file:
  
    "scp -F vagrant-sshPlaybooks/Reboot_IF_Required.yml Playbooks/Linux_Reboot.yml..."
  
  
    
## Running Playbooks

ssh onto the Controller Node

    vagrant ssh controller
  
Move to: /home/vagrant/ansible_project
 
    cd /home/vagrant/ansible_project
  
Now you are free to run your playbooks
 
    ansible-playbook Linux_reboot.yml

## Vagrantfile

The Vagrantfile can be altered to change the virutal machine provisioning if you wish to ulter the lab configuration


### boostrap.sh / key_gen.sh / key_setup.sh 

These files are used in the inital Ansible_Lab_setup.sh script and automate all the steps nessisary to create a lab where all you need to worry about is learning and testing ansible.


## To kill your Lab run the following on your host machine:

    vagrant destroy -f


## Authors

  - **Philip Holdsworth**


## Acknowledgments

  - Inspiration from KarthickSudhakar
 
