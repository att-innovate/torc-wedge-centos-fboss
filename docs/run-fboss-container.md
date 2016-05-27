## Run FBOSS Container on Wedge

It is assumed that the fboos-2.0 container image is available on the wedge.
Please refer to the [build-containers][1] doc for any build instructions.

Replace WEDGE_IP with the IP of your Wedge Microserver.

    $ ssh root@WEDGE_IP
    $ cd torc-wedge-centos-fboss/wedge/scripts
    $ ./run-fboss-container.sh

Interact with fboss using fboss-client

    $ docker run --net=host fboss-client list_routes
    $ docker run --net=host fboss-client list_ports

Stop fboss

    $ ./stop-fboss-container.sh

[1]: ./build-containers.md
