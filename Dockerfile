FROM alpine:3.8

ARG HELM_VERSION=v2.9.1

RUN apk add --no-cache curl ca-certificates \
    && curl -O https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && tar -zxvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -f /helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && helm init -c

RUN addgroup -g 1001 -S orca \
    && adduser -u 1001 -D -S -G orca orca 

USER orca

COPY orca /usr/local/bin