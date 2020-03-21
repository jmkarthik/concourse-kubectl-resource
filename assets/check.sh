#!/usr/bin/env sh
sed -i s/version/$RANDOM/g /opt/resource/version.json
cat /opt/resource/version.json