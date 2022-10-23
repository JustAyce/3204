sudo docker build 3204/kali -t justayce/kali
sudo docker run -d --name KALI justayce/kali --network elk_elk
sudo docker exec -d --name KALI python3 -m http.server 80 #didn't bind the IP cause I'm not sure how to get docker's IP before this. Tested with 0.0.0.0 and it works
