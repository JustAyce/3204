FROM kalilinux/kali-rolling

# Set working directory to /root
WORKDIR /opt

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
COPY hoaxshell.py /opt/hoaxshell.py
COPY C2-crackHash.py /opt/C2-crackHash.py
COPY wordlist.txt /opt/wordlist.txt

#Set up HoaxShell
RUN chmod +x /opt/hoaxshell.py \
  && pip3 install ipython\
  && pip3 install flask


# Set up Exfil
RUN git clone https://github.com/IngoKl/HTTPUploadExfil.git /opt/HTTPUploadExfil

RUN cd /opt/HTTPUploadExfil \
  && go build

RUN python3 /opt/hoaxshell.py -o -s 10.0.0.60 &

RUN python3 /opt/C2-crackHash.py &

CMD /opt/HTTPUploadExfil/httpuploadexfil :1337 /root/loot	

# ENTRYPOINT ["/bin/zsh"]
