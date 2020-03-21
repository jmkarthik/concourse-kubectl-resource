FROM alpine

#Install k8s

RUN apk add jq

RUN mkdir -p /opt/resource

WORKDIR /opt/resource

COPY assets/check.sh check
COPY assets/in.sh in
COPY assets/out.sh out
COPY assets/version.json version.json

RUN chmod a+x check in out


