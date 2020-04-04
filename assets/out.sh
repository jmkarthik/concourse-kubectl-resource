#!/usr/bin/env sh

echo "Starting out20" >&2

data=$(cat -)

uri=$(echo $data | jq -r .source.api_server_uri)
namespace=$(echo $data | jq -r .source.namespace)
certificate_authority_data=$(echo $data | jq -r .source.certificate_authority_data)
token=$(echo $data | jq -r .source.token)
# insecure-skip-tls-verify=$(echo $data | jq -r .source.insecure-skip-tls-verify)
user_name=$(echo $data | jq -r .source.user_name)
password=$(echo $data | jq -r .source.password)


file=$(echo $data | jq -r .params.file)

outJson='{"version": { "value": "ver"}, "metadata": [{ "name": "key-value"}]}'

basePath="/tmp/build/put/"

cluster=cluster1
context=context1

kubectl config set-cluster $cluster --server=$uri >&2
kubectl config set-context $context --cluster=$cluster --user=$user_name --namespace=$namespace >&2


kubectl config set clusters.$cluster.certificate-authority-data $certificate_authority_data >&2
kubectl config set-credentials $user_name --token=$token >&2

# kubectl config set-credentials $user_name --username=$user_name --password=$password >&2


kubectl config use-context $context >&2

kubectl apply -f $basePath$file >&2

# Clean up - 1. Delete cluster and context from kubeconfig

outJson=$(echo $outJson | sed s~key-value~$file~g)
echo $outJson



echo "Out completed" >&2

