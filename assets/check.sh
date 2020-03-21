#!/usr/bin/env sh
echo 'Starting to check' >&2
sed -i s/version/$RANDOM/g /opt/resource/version.json
cat /opt/resource/version.json
echo 'Check completed' >&2