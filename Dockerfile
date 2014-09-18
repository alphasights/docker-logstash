FROM jjbohn/java:0.0.1
MAINTAINER John Bohn <jjbohn@gmail.com>

ENV HOME /root

CMD ["/sbin/my_init"]

# Download and install logstash
WORKDIR /opt
RUN curl -O https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz
RUN tar -zxvf logstash-1.4.2.tar.gz

# runit
ADD logstash.sh /etc/service/logstash/run
ADD confd.sh /etc/service/confd/run

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
