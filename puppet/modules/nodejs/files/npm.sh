#!/usr/bin/env bash

### allow npm to install packages using http for both the root and vagrant user
sudo npm config set strict-ssl false
su - vagrant -c 'npm config set strict-ssl false'

### touch the file so vagrant knows everything went well
su - vagrant -c 'touch /home/vagrant/.vagrant/.npm'