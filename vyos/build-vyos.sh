mkdir /home/vagrant/vyos
cd /home/vagrant/vyos
wget https://s3-us.vyos.io/rolling/current/vyos-1.4-rolling-202209260217-amd64.iso
mkdir /home/vagrant/vyos/rootfs
sudo chmod 777 vyos-1.4-rolling-202209260217-amd64.iso
sudo mount -o loop vyos-1.4-rolling-202209260217-amd64.iso rootfs
sudo apt-get install -y squashfs-tools
snap install docker
mkdir /home/vagrant/vyos/unsquashfs
sudo unsquashfs -f -d unsquashfs/ rootfs/live/filesystem.squashfs
sudo tar -C unsquashfs -c . | sudo docker import - vyos:1.4-rolling-202209260217
# sudo tar -zcvf test.tar.gz unsquashfs && sudo docker import test.tar.gz vyos:1.4-rolling-202111281249
sudo umount rootfs
cd ..
# sudo rm -rf vyos
sudo docker run -d --rm --name vyos --privileged -v /lib/modules:/lib/modules vyos:1.4-rolling-202209260217 /sbin/init

# Run line 22 to get a shell of the vyos router and execute commands directly
# remember you need to configure to go to enable mode like cisco router.
# Before commiting, you can run the command "compare to see the changes made, additions and deletions"
# Once done run the command commit to commit the changes and save to save it
# sudo docker exec -ti vyos su - vyos

# This part works when i key in manually but not in script, idk why, pls try
# sudo docker cp /home/vagrant/3204/vyos/configure-vyos.sh vyos:/home/vyos/setup-vyos-config.sh
# sudo docker exec vyos sudo chown -R root:vyattacfg /opt/vyatta/config/active
# sudo docker exec vyos chmod +x /home/vyos/setup-vyos-config.sh && /home/vyos/setup-vyos-config.sh