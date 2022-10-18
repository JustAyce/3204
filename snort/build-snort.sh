#/bin/bash
cd ~/3204/snort/
docker build . -t justayce/snort
docker run -d --name docker-snort justayce/snort
docker cp ~/3204/snort/send_logs.py docker-snort:/send_logs.py
