FROM nginx:1.9.12
MAINTAINER Johannes M. Scheuermann <joh.scheuer@gmail.com>

RUN apt-get update && \
    apt-get install -y unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY files/start.sh /bin/start.sh
COPY files/default.ctmpl /templates/default.ctmpl

ENV CONSUL_TEMPLATE_V=0.14.0
ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_V}/consul-template_${CONSUL_TEMPLATE_V}_linux_amd64.zip /tmp
RUN unzip /tmp/consul-template_${CONSUL_TEMPLATE_V}_linux_amd64.zip -d /usr/local/bin

ENTRYPOINT ["/bin/start.sh"]
