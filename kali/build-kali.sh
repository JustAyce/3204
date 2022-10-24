#/bin/bash
sudo docker build 3204/kali -t justayce/kali
sudo docker run -d --network elk_elk --name KALI justayce/kali
sudo docker exec -d --name KALI python3 -m http.server 80
