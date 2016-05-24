#/bin/bash

cpDependencies() {
    local BASE="$1"
    local EXEC="$2"

    [ ! -d $BASE ] && mkdir -p $BASE || :

    LIBRARIES="$(ldd $EXEC | awk '{ print $3 }' | egrep -v ^'\(')"
    for I in $LIBRARIES
    do
        LIBRARY="$(basename $I)"
        cp $I $BASE$LIBRARY
    done
}

cd ~/fboss/build
mkdir -p pkg/lib
cp wedge_agent pkg/

cpDependencies pkg/lib/ wedge_agent

tar --directory pkg/ -zcvf /vagrant/pkg/fboss.tar.gz .



