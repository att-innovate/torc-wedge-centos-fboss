## Setup Wedge

Update CentOS and install Docker

    $ rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
    $ yum update -y
    $ yum -y install docker-io
    $ service docker start

Verify that SELinux is in `permissive` mode

    $ getenforce

If mode is set to `enforcing`, check [Permissive versus enforcing][1] for steps how to change it.

Turn of firewall

    $ iptables -F

[1]: https://wiki.gentoo.org/wiki/SELinux/Tutorials/Permissive_versus_enforcing
