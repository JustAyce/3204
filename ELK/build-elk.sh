#/bin/bash
cd ~/3204/ELK/
docker build . -t justayce/elk
docker run -d --name docker-elk justayce/elk
