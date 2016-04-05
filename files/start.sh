#!/bin/sh
nginx -g "daemon off;" && consul-template -consul=$CONSUL_URL -template="/templates/default.ctmpl:/etc/nginx/conf.d/default.conf:nginx -s reload"
