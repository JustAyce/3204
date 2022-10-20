FROM ubuntu:22.04

RUN apt update

RUN apt install -y wget python3

WORKDIR /opt/

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.4.2-linux-x86_64.tar.gz && \
    tar -xzf elasticsearch-8.4.2-linux-x86_64.tar.gz
# cd elasticsearch-8.4.2/
RUN wget https://artifacts.elastic.co/downloads/kibana/kibana-8.4.3-linux-x86_64.tar.gz && \
    tar -xzf kibana-8.4.3-linux-x86_64.tar.gz

# elasticsearch/bin/elasticseac-users ...
CMD /opt/elasticsearch-8.4.2/bin/elasticsearch-users useradd amanda -p amanda -r superuser
CMD /opt/elasticsearch-8.4.2/bin/elasticsearch-certutil ca --silent --pem -out /opt/elasticsearch-8.4.2/config/certs/ca.zip
CMD unzip config/certs/ca.zip -d config/certs/
CMD /opt/elasticsearch-8.4.2/bin/elasticsearch-certutil cert --silent --pem -out /opt/elasticsearch-8.4.2/config/certs/certs.zip --ca-cert /opt/elasticsearch-8.4.2/config/certs/ca/ca.crt --ca-key /opt/elasticsearch-8.4.2/config/certs/ca/ca.key --name websrv --ip 192.168.0.228
CMD /opt/elasticsearch-8.4.2/bin/elasticsearch

EXPOSE 5601 9200 9300 9600 5044
VOLUME /var/lib/elasticsearch