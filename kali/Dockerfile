FROM kalilinux/kali-rolling

# Set working directory to /root
WORKDIR /root

# Update
RUN apt -y update && DEBIAN_FRONTEND=noninteractive apt -y dist-upgrade && apt -y autoremove && apt clean

# Install common and useful tools
RUN apt -y install curl wget vim git net-tools whois netcat-traditional pciutils usbutils

# Install useful languages
RUN apt -y install python3-pip golang-go

# Install proxychains
RUN apt -y install tor proxychains
# COPY config/proxychains.conf /etc/proxychains.conf

# Install ZSH shell with custom settings and set it as default shell
RUN apt -y install zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# COPY config/.zshrc .

# Crack Password
COPY C2-crackHash.py .

RUN python3 -m pip install flask\
  && python3 C2-crackHash.py &

# Set up Exfil
RUN git clone https://github.com/IngoKl/HTTPUploadExfil.git /opt/HTTPUploadExfil \
  && cd /opt/HTTPUploadExfil
  
CMD cd /opt/HTTPUploadExfil\
  && go build 

# Set up Hoax Shell
RUN git clone https://github.com/t3l3machus/hoaxshell.git /opt/hoaxshell \
  && cd /opt/hoaxshell
  && pip3 install -r requirements.txt
  
# ENTRYPOINT ["/bin/zsh"]
