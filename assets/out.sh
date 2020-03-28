#!/usr/bin/env sh

echo "Starting out15" >&2

data=$(cat -)

uri=$(echo $data | jq -r .source.api_server_uri)
namespace=$(echo $data | jq -r .source.namespace)
user_name=$(echo $data | jq -r .source.user_name)
password=$(echo $data | jq -r .source.password)

file=$(echo $data | jq -r .params.file)

outJson='{"version": { "value": "ver"}, "metadata": [{ "name": "key-value"}]}'

# kubectl version --client >&2

# ls /tmp/build/put/resGit/ >&2
basePath="/tmp/build/put/"

cluster=cluster1
context=context1

kubectl config set-cluster $cluster --server=$uri >&2
kubectl config set-context $context --cluster=$cluster --user=$user_name --namespace=$namespace >&2
kubectl config set-credentials $user_name --username=$user_name --password=$password >&2
kubectl config use-context $context >&2

# kubectl config view >&2

cat $basePath$file >&2

cat /etc/resolv.conf >&2

kubectl apply -f $basePath$file >&2


outJson=$(echo $outJson | sed s~key-value~$file~g)

echo $outJson

echo "Out completed" >&2

