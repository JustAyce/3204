Vagrant.configure("2") do |config|

  ###########################
  ### Virtual Box Setting ###
  ###########################
    config.vm.provider "virtualbox" do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    #   vb.gui = true
      # Customize the amount of memory on the VM:
      vb.memory = "4096"
      vb.cpus = 4
    end

  #########################
  ###  Windows Machine  ###
  #########################
  config.vm.define "Win10" do |win10test|
    win10test.vm.box = "gusztavvargadr/windows-10"
    win10test.vm.box_version="2102.0.2203"
    win10test.vm.network "private_network", ip: "10.0.0.65"
    win10test.vm.provision "shell", inline: <<-'SHELL'
      REG ADD "HKLM\SOFTWARE\Poli-cies\Microsoft\Windows\PowerShell\ModuleLogging" /v EnableModuleLogging /t REG_SZ /f /d 1
      REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames" /v * /t REG_SZ /f /d *
      REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" /v EnableScriptBlockLogging /t REG_SZ /f /d 1
      REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" /v EnableScriptBlockInvocationLogging /t REG_SZ /f /d 1
      net user user2 user2 /add
      $password = ConvertTo-SecureString 'user2' -AsPlainText -Force
      $credential = New-Object System.Management.Automation.PSCredential ('user2', $password)
      start powershell -credential $credential ; exit
      $username = 'user2'
      $password ='user2'
      $pass = ConvertTo-SecureString -AsPlainText $Password -Force
      $SecureString=$pass
      $MySecureCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username,$SecureString 
      start powershell -Credential $MySecureCreds -ErrorAction SilentlyContinue
      wget https://github.com/JustAyce/3204/blob/main/Sysmon/Sysmon.zip?raw=true -o ~/Desktop/Sysmon.zip
      Expand-Archive ~/Desktop/Sysmon.zip C:/'Program Files'/Sysmon
      wget https://github.com/JustAyce/3204/blob/main/Winlogbeat/Winlogbeat.zip?raw=true -o ~/Desktop/Winlogbeat.zip
      Expand-Archive ~/Desktop/Winlogbeat.zip C:/'Program Files'/Winlogbeat
      sc.exe create Winlogbeat binpath= "C:\Program Files\Winlogbeat\winlogbeat.exe" start= auto
      C:/'Program Files'/Sysmon/sysmon.exe -i -accepteula -h md5,sha256,imphash -l -n       
      PowerShell.exe -ExecutionPolicy UnRestricted -File .\install-service-winlogbeat.ps1
      .\winlogbeat.exe test config -c .\winlogbeat.yml -e
      Start-Service winlogbeat
    SHELL
  end

  #########################
  ###   Ubuntu Server   ###
  #########################
    config.vm.define "Ubuntu" do |sv1|
      #sv1.vm.box = "ubuntu/bionic64"
      sv1.vm.box = "ubuntu/focal64"
      sv1.vm.box_version="20221010.0.0"
      sv1.vm.network "private_network", ip: "10.0.0.100"
      sv1.vm.provision "shell", inline: <<-'SHELL'
        sudo apt install -y git wget python3
        sudo snap install docker
        git clone --branch test2 https://github.com/JustAyce/3204.git /home/vagrant/3204
        chmod 755 -R /home/vagrant/3204/ELK
        chmod 755 -R /home/vagrant/3204/kali
        chmod 755 -R /home/vagrant/3204/setup.sh
        /home/vagrant/3204/setup.sh
      SHELL
    end
  end
