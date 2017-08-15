FROM alpine:latest

LABEL author "Korviakov Andrey"
LABEL maintainer "4lifenet@gmail.com"

RUN \
    apk add --no-cache --update \
        ca-certificates \
        tzdata \
        curl \
        jq \
        bc \
    && ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
    && CONSUL_TEMPLATE_VERSION=$(curl -s https://api.github.com/repos/hashicorp/consul-template/tags | jq -r ".[0] .name" | tr -d v) \
    && curl -fSl https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tgz | tar -C /bin -zx
    # CONSUL_VERSION=$(curl -s https://api.github.com/repos/hashicorp/consul/tags | jq -r ".[0] .name" | tr -d v) \
    # && curl -fSl https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -o /tmp/consul.zip \
    # && unzip /tmp/consul.zip -d /bin \
    # && rm -f /tmp/consul.zip