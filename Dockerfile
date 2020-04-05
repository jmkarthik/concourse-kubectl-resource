FROM alpine

RUN apk add jq curl && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    mkdir -p /opt/resource

COPY assets/ /opt/resource

RUN chmod a+x /opt/resource/check /opt/resource/in /opt/resource/out
