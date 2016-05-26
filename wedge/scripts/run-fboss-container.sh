#/bin/bash

# remove previous log-files
rm -rf /tmp/wedge_agent*

# increase thread run time in general
echo 950000 > /cgroup/cpu/docker/cpu.rt_runtime_us

# start container with backdoor
ID=$(docker run -d --privileged=true --net=host --name=fboss-2.0 --volume=/tmp/:/logs/ fboss-2.0)

# increase thread run time for this contaienr
echo 950000 > /cgroup/cpu/docker/$ID/cpu.rt_runtime_us

# wait for everything to be ready
sleep 5

# start fboss through backdoor
curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" 127.0.0.1:8085/async -d '{"cmd":"/start-fboss.sh"}'

# verify log files
echo check log files from wedge_agent in /tmp

