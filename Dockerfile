FROM jjbohn/java:0.0.1
MAINTAINER John Bohn <jjbohn@gmail.com>

ENV HOME /root

CMD ["/sbin/my_init"]

# Download and install logstash
WORKDIR /opt
RUN curl -O https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz
RUN tar -zxvf logstash-1.4.2.tar.gz

RUN mkdir /etc/service/logstash
ADD logstash.sh /etc/service/logstash/run
RUN chmod 775 /etc/service/logstash/run

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
