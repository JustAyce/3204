Vagrant.configure("2") do |config|

  ###########################
  ### Virtual Box Setting ###
  ###########################
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = 4
    end
  
  #########################
  ###  Windows Machine  ###
  #########################
    
    
  #########################
  ###   Ubuntu Server   ###
  #########################
    config.vm.define "Logger" do |sv1|
      sv1.vm.box = "ubuntu/bionic64"
      sv1.vm.box_version="20221010.0.0"
      sv1.vm.network "private_network", ip: "10.0.0.100"
      sv1.vm.provision "shell", inline: <<-'SHELL'
        apt install -y git wget python3
        snap install docker
        git clone https://github.com/JustAyce/3204.git /home/vagrant/3204
        chmod 755 -R /home/vagrant/3204/ELK
        chmod 755 -R /home/vagrant/3204/snort
        chmod 755 -R /home/vagrant/3204/vyos
        chmod 755 -R /home/vagrant/3204/setup.sh
        /home/vagrant/3204/setup.sh
      SHELL
    end
  end
  
