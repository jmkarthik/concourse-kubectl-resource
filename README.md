# Kubectl resource
Deploys resources to a Kubernetes cluster using "kubectl apply -f" command

## SourceConfiguration

* `api_server_uri`: *Required.* The API Server URI of the Kubernetes Cluster.

* `namespace`: *Required.* The namespace to which the files need to be applied.

* `certificate_authority_data`: *Required.* The base64 format of the certificate authority to authenticate to the Kubernetes cluster.

* `token`: *Required.* The token to authenticate to the Kubernetes cluster.

### Example

Resource configuration for a Kubernetes cluster

```yaml
resource_types:
- name: concourse-kubectl-resource-type
  type: docker-image
  source: 
    repository: jmkarthik/concourse-kubectl-resource
    tag: latest

resources:
- name: concourse-kubectl-resource
  type: concourse-kubectl-resource-type
  source:
    api_server_uri: {{server}}
    namespace: {{namespace}}
    certificate_authority_data: {{cad}}
    token: {{token}}
```

## Behavior

### `check`: Not applicable

### `in`: Not applicable

### `out`: Apply file or files in a folder to the Kubernetes cluster configured.

#### Parameters

* `file`: path to the file which needs to be applied using kubectl or path to the folder containing the files to be applied. The file / folder could have been fetched using GET for a Git repository or a S3 bucket

### Example

PUT configuration to apply a file

```yaml
- put: my-ckr
  params:
    file: "resGit/deployment-1.yml"
```

PUT configuration to apply files in a folder

```yaml
- put: my-ckr
  params:
    file: "resGit/
```

### Sample Pipeline yml

```yaml
resource_types:
- name: ckr
  type: docker-image
  source: 
    repository: jmkarthik/concourse-kubectl-resource
    tag: latest

resources:

- name: resGit
  type: git
  source:
    uri: https://github.com/jmkarthik/app-sample.git
    branch: master

- name: my-ckr
  type: ckr
  source:
    api_server_uri: {{server}}
    namespace: {{namespace}}
    certificate_authority_data: {{cad}}
    token: {{token}}

jobs:
- name: my-ckr-job
  plan:
  - get: resGit
  - put: my-ckr
    params:
      file: "resGit/deployment-1.yml"
```
