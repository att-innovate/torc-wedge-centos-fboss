FROM ubuntu:14.04

RUN apt-get update -qq

RUN apt-get -y install python-ipaddr python-thrift thrift-compiler git

RUN git clone https://github.com/neuhausler/fboss.git

ENV FBOSS=/fboss

RUN sed -i -e 's/^namespace cpp2 facebook.fboss/#namespace cpp2 facebook.fboss/' $FBOSS/fboss/agent/if/*.thrift
RUN sed -i -e 's/^from fboss.agent/from fboss.ctrl/' $FBOSS/fboss/agent/tools/fboss_route.py
RUN cd $FBOSS/fboss/agent/if && for p in *.thrift; do thrift -I $FBOSS -r --gen py $p; echo $p done; done

ENV FBOSS_IF=$FBOSS/fboss/agent/if/gen-py
ENV PYTHONPATH=$FBOSS_IF/neteng/:$FBOSS/external/fbthrift/thrift/lib/py:$FBOSS_IF/:$FBOSS/external/fbthrift/thrift/lib/py

ENTRYPOINT ["python", "/fboss/fboss/agent/tools/fboss_route.py"]
