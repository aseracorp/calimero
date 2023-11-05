#!/bin/sh

version=3.0-SNAPSHOT
arch=amd64

rsync -av --exclude=*/.git* --exclude=.gradle/ --exclude=.idea/ --exclude=bin/ --exclude=test/ --exclude=target/ --exclude=build/ --exclude=out/ \
    ../calimero-core ../calimero-tools ../serial-native ../calimero-device ../calimero-server ../calimero-usb ./repos/

#custom-liberica/build-jdk.sh $1
#(cd custom-jdk && ./build-custom-jdk.sh $1)

#cmd=build
cmd="buildx build --platform=linux/amd64"

echo
echo "Building knxtools..."
docker $cmd --build-arg libversion=$version -f calimero-tools/Dockerfile -t calimeroproject/knxtools -t calimeroproject/knxtools:$version \
       -t calimeroproject/knxtools:latest-$arch -t calimeroproject/knxtools:$version-$arch . $1
echo
echo
echo "Building knxserver..."
docker $cmd --build-arg libversion=$version -f calimero-server/Dockerfile -t calimeroproject/knxserver -t calimeroproject/knxserver:$version \
       -t calimeroproject/knxserver:latest-$arch -t calimeroproject/knxserver:$version-$arch . $1

