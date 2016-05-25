#!/bin/bash

mkdir -p /tmp/warm_boot
/wedge_agent --mode=wedge --tun_intf=false --can_warm_boot=false  --logtostderr=1 --stderrthreshold=0 --log_dir=/logs --config=/torc.json -v 1 -v 2

