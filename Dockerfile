FROM alpine

# Reduce number of layers

RUN apk add jq

RUN apk add curl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl

RUN mv ./kubectl /usr/local/bin/kubectl

RUN mkdir -p /opt/resource

WORKDIR /opt/resource

COPY assets/check.sh check
COPY assets/in.sh in
COPY assets/out.sh out
COPY assets/version.json version.json

RUN chmod a+x check in out


