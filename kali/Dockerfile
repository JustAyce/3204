FROM kalilinux/kali-rolling

# Set working directory to /root
WORKDIR /root

# Update
RUN apt -y update && DEBIAN_FRONTEND=noninteractive apt -y dist-upgrade && apt -y autoremove && apt clean

# Install common and useful tools
RUN apt -y install curl wget vim git net-tools whois netcat-traditional pciutils usbutils

# Install useful languages
RUN apt -y install python3-pip

# Install proxychains
RUN apt -y install tor proxychains
COPY config/proxychains.conf /etc/proxychains.conf

# Install exe2hexbat
RUN apt -y install exe2hexbat

# Install ZSH shell with custom settings and set it as default shell
RUN apt -y install zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY config/.zshrc .

ENTRYPOINT ["/bin/zsh"]