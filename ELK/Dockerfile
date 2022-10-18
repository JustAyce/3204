FROM ubuntu:22.04

RUN apt update

RUN apt install -y wget python3

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.4.2-linux-x86_64.tar.gz && \
    tar -xzf elasticsearch-8.4.2-linux-x86_64.tar.gz && \
    cd elasticsearch-8.4.2/

CMD ./bin/elasticsearch-users useradd amanda -p amanda -r superuser
CMD ./bin/elasticsearch-certutil ca --silent --pem -out config/certs/ca.zip
CMD unzip config/certs/ca.zip -d config/certs/
CMD ./bin/elasticsearch-certutil cert --silent --pem -out config/certs/certs.zip --ca-cert config/certs/ca/ca.crt --ca-key config/certs/ca/ca.key --name websrv --ip 192.168.0.228
CMD ./bin/elasticsearch -d
