#!/usr/bin/env sh

echo "Starting out4" >&2

data=$(cat -)

uri=$(echo $data | jq -r .source.api_server_uri)
user_name=$(echo $data | jq -r .source.user_name)
password=$(echo $data | jq -r .source.password)

file=$(echo $data | jq -r .params.file)

outJson='{"version": { "value": "ver"}, "metadata": [{ "name": "key-value"}]}'

kubectl version --client >&2

outJson=$(echo $outJson | sed s~key-value~$file~g)

echo $outJson

echo "Out completed" >&2

