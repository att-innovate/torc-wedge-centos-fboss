#/bin/bash

echo 950000 > /cgroup/cpu/docker/cpu.rt_runtime_us

ID=$(docker run -d --privileged=true --net=host --name=fboss-2.0 --volume=/tmp/:/logs/ fboss-2.0)
echo 950000 > /cgroup/cpu/docker/$ID/cpu.rt_runtime_us

