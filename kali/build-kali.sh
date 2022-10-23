sudo docker build /home/vagrant/3204/kali/Dockerfile -t justayce/kali
sudo docker run -d --rm --network elk_elk justayce/kali --name KALI
sudo docker exec --name KALI python3 -m http.server 80 #didn't bind the IP cause I'm not sure how to get docker's IP before this. Tested with 0.0.0.0 and it works
