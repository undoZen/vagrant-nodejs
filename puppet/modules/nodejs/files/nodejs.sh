#!/usr/bin/env bash

### move to /opt
cd /opt

### get latest node
FILENAME=$(wget --quiet -O - http://nodejs.org/dist/latest/ | grep -i linux-x86 | cut -d\" -f2)
if [ $FILENAME ]; then
  DIRECTORY=/opt/$(basename $FILENAME .tar.gz)
  URL=http://nodejs.org/dist/latest/$FILENAME
else
  echo Could not find the appropriate Node.js download...
  exit 1
fi

wget $URL
if [ $? -eq 0 ]; then
  tar -xzpvf $FILENAME
  rm $FILENAME

  ### symlink to /usr/local
  ln -s $DIRECTORY/bin/node /usr/local/bin/node
  ln -s $DIRECTORY/bin/npm /usr/local/bin/npm

  ### touch the file so vagrant knows everything went well
  touch /opt/vagrant-provision/.nodejs
else
  echo Could not fetch Node.js...
  exit 1
fi
