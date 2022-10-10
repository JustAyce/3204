#/bin/bash
docker build -t docker-snort /opt/logger/snort/Dockerfile
docker cp /opt/logger/snort/send_logs.py docker-snort:/send_logs.py
