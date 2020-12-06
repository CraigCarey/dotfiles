FROM ghcr.io/craigcarey/dotfiles/base

WORKDIR /build/

RUN apt-get update -y

COPY install_gst.sh .
RUN bash install_gst.sh

WORKDIR /home/craig/

CMD ["/usr/sbin/sshd", "-D"]
