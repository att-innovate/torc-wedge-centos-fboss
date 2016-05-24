#/bin/bash

sudo apt-get -y install git
git clone https://github.com/neuhausler/fboss.git
git checkout 6292840 

cd fboss

# patch to set specific versions of dependencies
sed -i 's,folly.git$,folly.git 0558fb6,' getdeps.sh
sed -i 's,wangle.git$,wangle.git 4903f96,' getdeps.sh
sed -i 's,fbthrift.git$,fbthrift.git 3a120c8,' getdeps.sh

# build dependencies
./getdeps.sh

cd ..
chown -R vagrant fboss
chgrp -R vagrant fboss


