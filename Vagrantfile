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
  config.vm.define "Win10" do |win10test|
    win10test.vm.box = "gusztavvargadr/windows-10"
    win10test.vm.box_version="2102.0.2205"
    win10test.vm.network "private_network", ip: "10.0.0.65"
    win10test.vm.provision "shell", inline: <<-'SHELL'
      echo "Something new"
      net user user2 user2 /add
      $password = ConvertTo-SecureString 'user2' -AsPlainText -Force
      $credential = New-Object System.Management.Automation.PSCredential ('user2', $password)
      echo $credential.UserName
      echo $credential.GetNetworkCredential().Password
      start powershell -credential $credential ; exit
      $username = 'user2'
      $password ='user2'
      $pass = ConvertTo-SecureString -AsPlainText $Password -Force
      $SecureString=$pass
      $MySecureCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username,$SecureString 
      #echo $MySecureCreds
      #echo $SecureString
      start powershell -Credential $MySecureCreds -ErrorAction SilentlyContinue
    SHELL
  end
    
  #########################
  ###   Ubuntu Server   ###
  #########################
    config.vm.define "Ubuntu" do |sv1|
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
        # /home/vagrant/3204/setup.sh
        /home/vagrant/3204/vyos/build-vyos.sh
      SHELL
    end
  end
  
