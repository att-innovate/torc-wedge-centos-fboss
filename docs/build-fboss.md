## Build FBOSS

Tested on MacBook Pro under OSX El Capitan, requires:
- [VirtualBox 5.0.20][1]
- [Vagrant 1.7.4][2]
- Host with >= 5GB of memory and >= 3 cpus

#### Build Dependencies ####

    $ cd fboss
    $ vagrant up
    
#### Compile and Package FBOSS ####

    $ vagrant ssh
    $ /vagrant/scripts/build-fboss.sh
    $ /vagrant/scripts/build-package.sh
    $ exit

FBOSS package, `fboss.tar.gz` will be available in the `./fboss/pkg` directory on the host.

[1]: https://www.virtualbox.org
[2]: https://www.vagrantup.com
