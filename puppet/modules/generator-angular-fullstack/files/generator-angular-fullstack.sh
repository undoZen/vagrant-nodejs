#!/usr/bin/env bash
sudo npm install -g generator-angular-fullstack

if [ $? -eq 0 ]; then
  ### touch the file so vagrant knows everything went well
  touch /opt/vagrant-provision/.generator-angular-fullstack
else
  echo Could not install generator-angular-fullstack...
  exit 1
fi
