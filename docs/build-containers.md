## Build FBOSS Docker Containers on Wedge

Building the fboss and fboss-client container on the Wedge.

#### Clone github directory ####

Replace WEDGE_IP with the IP of your Wedge Microserver.

    $ ssh root@WEDGE_IP
    $ git clone https://github.com/att-innovate/torc-wedge-centos-fboss.git
    
#### Build Docker Containers ####

This assumes that `fboss.tar.gz` got previously transfered to the `/tmp/`folder.

    $ cd ./torc-wedge-centos-fboss/docker/scripts
    $ ./build-fboss-containers.sh

