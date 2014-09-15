#!/bin/bash
config_url=${LOGSTASH_CONFIG_URL:?"You must set LOGSTASH_CONFIG_URL"}

/usr/bin/curl -o /etc/logstash.conf "$config_url"
/opt/logstash-1.4.2/bin/logstash -f /etc/logstash.conf
