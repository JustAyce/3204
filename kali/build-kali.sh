#/bin/bash
sudo docker build 3204/kali -t justayce/kali
sudo docker run -d --network elk_elk --restart unless-stopped --name KALI -p 80:80 justayce/kali
sudo docker exec -d KALI python3 -m http.server 80
