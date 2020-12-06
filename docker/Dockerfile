FROM ubuntu:20.10

# 22 for ssh server, 7777 for gdb server
EXPOSE 22 7777

ARG TZ="Europe/Belfast"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV LANG en_GB.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_GB.UTF-8

WORKDIR /build/

RUN apt-get update -y

COPY install_scripts/sudo_alias.sh .
COPY install_scripts/install_basic_tools.sh .
COPY install_scripts/install_term_tools.sh .
COPY install_scripts/install_programming_tools.sh .
RUN bash install_basic_tools.sh
RUN bash install_term_tools.sh
RUN bash install_programming_tools.sh

# Set up user
RUN set -eu; \
    mkdir -p /home/craig/; \
    groupadd -r -g 1000 craig; \
    useradd --no-log-init -r -s $(which zsh) -g craig -u 1000 craig; \
    echo 'craig:toor' | chpasswd; \
    chown -R craig:craig /home/craig/; \
    usermod -aG sudo craig;

# Enable remote debugging
RUN set -eu; \
    mkdir /var/run/sshd; \
    echo 'root:root' | chpasswd; \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config; \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd; \
    mkdir -p /var/run/sshd; \
    mkdir -p /root/.ssh; \
    chmod 700 /root/.ssh; \
    ssh-keygen -A; \
    echo "export DISPLAY=:0" >> /etc/profile

WORKDIR /home/craig/

CMD ["/usr/sbin/sshd", "-D"]
