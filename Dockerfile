FROM nginx:mainline-alpine
MAINTAINER Johannes M. Scheuermann <joh.scheuer@gmail.com>

ENV CONSUL_TEMPLATE_V=0.14.0

RUN apk add --no-cache unzip curl && \
    curl -o /tmp/consul_template.zip  https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_V}/consul-template_${CONSUL_TEMPLATE_V}_linux_amd64.zip && \
    unzip /tmp/consul_template.zip -d /usr/local/bin && \
    apk del unzip curl && \
    rm -rf /tmp/* /var/tmp/*

COPY files/start.sh /bin/start.sh
COPY files/default.ctmpl /templates/default.ctmpl

ENTRYPOINT ["/bin/start.sh"]
