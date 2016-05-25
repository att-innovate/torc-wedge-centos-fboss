## How to build and operate FBOSS on the Facebook Wedge Switch

Btw, out of the box that is not as easy as you would think. The problem:

- [OpenNSL][1], the Open Network Switch Library that is required by the Trident II switch chip only supports **CentOS 6.5**.
- [Facebook Wedge 16X (pdf)][2] comes with **CentOS 6.5** pre-installed, reason see above.
- [FBOSS][3], the Facebook Open Switching System Software for controlling the switch comes with build instructions for **Ubuntu 14.04**. But it requires OpenNSL kernel modules which are only available for **CentOS 6.5**.

#### The Hack ####

Nowadays if you have to run Ubuntu on CentOS you probably plan to use [Docker][4]. But the 2.6 kernel of CentOS 6.5 is not officially supported by Docker.
Fortunately we found that Docker version "1.7.1, build 786b29d/1.7.1" works suprisingly reliable on our Wedge.

Yet that is still not the end of the hack. The OpenNSL library wants to run a `real-time scheduling` task. That task needs to run continously for longer
than allowed by default for a cgroup-managed task. We had to do some additional hacking around `cpu.rt_runtime_us` as described in [Docker Issue 13983][5].
We added some backdoor to our FBOSS container and some special startup script to be able to orchestrate that multi-step startup procedere.

#### The Result ####

This repository contains all the scripts and steps required to get that hack going. We finally not only got FBOSS running under CentOS but we also ended
up with a reliable Docker environment which allowed us to do things that where beyond our immagination.

![torc diagram](https://github.com/att-innovate/torc-wedge-centos-fboss/blob/master/docs/torc.png?raw=true)

Picture, slide 33: [Facebook Keynote - Open Networking Summit 2016 (slides)][6]

We will contribute the complete setup including all source code to Open Source as a reference architecture for a **T**op-**o**f-**R**ack-**C**ontroller based autonomous rack .. stay tuned.

[1]: https://github.com/Broadcom-Switch/OpenNSL
[2]: http://www.edge-core.com/temp/ec_download/1602/Wedge-16X_DS_R01.pdf
[3]: https://github.com/facebook/fboss
[4]: https://www.docker.com
[5]: https://github.com/docker/docker/issues/13983
[6]: http://events.linuxfoundation.org/sites/events/files/slides/ONS-2016-fb-keynote-v3_0.pdf
