#!/usr/bin/env sh

# exec 3>&1 # make stdout available as fd 3 for the result
# exec 1>&2 # redirect all output to stderr for logging

echo "Starting in3" >&2

data=$(cat -)

outJson='{"version": { "value": "some-value"}, "metadata": [{ "server_uri": "uri", "username": "user_name", "pwd": "password"}]}'

uri=$(echo $data | jq -r .source.api_server_uri)
user_name=$(echo $data | jq -r .source.user_name)
password=$(echo $data | jq -r .source.password)
outJson=$(echo $outJson | sed s~uri~$uri~g)
outJson=$(echo $outJson | sed "s~user_name~$user_name~g")
outJson=$(echo $outJson | sed "s~password~$password~g")

echo $outJson
echo "In completed" >&2