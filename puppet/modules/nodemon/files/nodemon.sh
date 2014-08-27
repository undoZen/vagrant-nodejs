#!/usr/bin/env bash

sudo npm install -g nodemon
if [ $? -eq 0 ]; then
  ### touch the file so vagrant knows everything went well
  touch /opt/vagrant-provision/.nodemon
else
  echo Could not install nodemon...
  exit 1
fi
