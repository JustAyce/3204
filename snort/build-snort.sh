#/bin/bash
cd /home/vagrant/3204/snort/
docker build . -t justayce/snort
docker run -d --name docker-snort justayce/snort
docker cp /home/vagrant/3204/snort/send_logs.py docker-snort:/send_logs.py
