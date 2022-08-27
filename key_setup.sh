#!/usr/bin/env bash

#This scirpt will convert key_gen.sh to a linux compatible file
if [[ $(hostname) = "controller" ]]; then
  sudo dos2unix /home/vagrant/key_gen.sh
fi
