FROM alpine:latest

LABEL maintainer "4lifenet@gmail.com"

RUN \
    apk add --no-cache --update \
        ca-certificates \
        tzdata \
        curl \
        jq \
    && ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
    && CONSUL_TEMPLATE_VERSION=$(curl -s https://api.github.com/repos/hashicorp/consul-template/tags | jq -r ".[0] .name" | tr -d v) \
    && curl -fSl https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tgz | tar -C /bin -zx 