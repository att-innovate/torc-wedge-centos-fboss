## Build FBOSS Docker Container on Wedge

#### Clone github directory ####

Replace WEDGE_IP with the IP of your Wedge Microserver.

    $ ssh root@WEDGE_IP
    $ git clone https://github.com/att-innovate/torc-wedge-centos-fboss.git
    
#### Build Docker Container ####

This assumes that `fboss.tar.gz` got previously transfered to the `/tmp/`folder.

    $ cd ./torc-wedge-centos-fboss/Docker/fboss/provision
    $ tar -zxvf /tmp/fboss.tar.gz
    $ mv wedge_agent ./bin
    $ cd ..
    $ docker build -t fboss .

