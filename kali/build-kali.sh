#/bin/bash
sudo docker build 3204/kali -t justayce/kali
sudo docker run -d --network elk_elk --restart unless-stopped --name KALI -p 80:80 -p 5000:5000 justayce/kali
sudo docker exec -d KALI python3 /opt/C2-crackHash.py & sudo docker exec -d KALI python3 /opt/HTTPUploadExfil/httpuploadexfil :1337 /root/loot	