#!/bin/bash
resource=${LOGSTASH_TEMPLATE_RESOURCE_URL:?"You must set LOGSTASH_TEMPLATE_RESOURCE_URL"}
template=${LOGSTASH_SOURCE_TEMPLATE_URL:?"You must set LOGSTASH_SOURCE_TEMPLATE_URL"}

/usr/bin/curl -o /etc/confd/conf.d/logstash.conf.tmpl "$template"
/usr/bin/curl -o /etc/confd/conf.d/logstash.toml "$resource"

confd -interval 30 -prefix '/elasticsearch'
