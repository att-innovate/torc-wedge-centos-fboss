#/bin/bash

sudo apt-get -y install git
git clone https://github.com/neuhausler/fboss.git

cd fboss
./getdeps.sh

cd ..
chown -R vagrant fboss
chgrp -R vagrant fboss


