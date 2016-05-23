## How to build and operate FBOSS on the Facebook Wedge

Btw, out of the box that is not as easy as you would think. The problem:

- [OpenNSL][1], the Open Network Switch Library that is required by the Trident II switch chip only supports **CentOS 6.5**.
- [Facebook Wedge 16X (pdf)][2] comes with **CentOS 6.5** pre-installed, reason see above.
- [FBOSS][3], the Facebook Open Switching System Software for controlling the switch comes with build instructions for **Ubuntu 14.04**.

Nowadays if you have to run Ubuntu on CentOS you probably think about using [Docker][4]. But the 2.6 kernel of CentOS 6.5 is not officially supported by Docker.
Fortunately we found that version `1.7.1, build 786b29d/1.7.1` works suprsingly reliable on our Wedge.

Yet that is still not the end of the hack. The OpenNSL library wants to run a `real-time scheduling` task. That task needs to run continously for longer
than allowed by default for a cgroup-managed task. We had to do some additional hacking around `cpu.rt_runtime_us` as described in [Docker Issue 13983][5]

This repository contains all the scripts and steps required to get that hack going. We finally not only got FBOSS running under CentOS but we also ended
up with a reliable Docker environment, which allowed us to do things that where beyond our immagination.

![image](https://github.com/att-innovate/torc-wedge-centos-fboss/blob/master/FBOSS/docs/torc.png?raw=true)

[1]: https://github.com/Broadcom-Switch/OpenNSL
[2]: http://www.edge-core.com/temp/ec_download/1602/Wedge-16X_DS_R01.pdf
[3]: https://github.com/facebook/fboss
[4]: https://www.docker.com
[5]: https://github.com/docker/docker/issues/13983
