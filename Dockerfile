FROM debian:bookworm

LABEL maintainer="0x6A4B <0x6A4B@proton.me>"

RUN apt update && \
    apt -qy full-upgrade && \
    apt install -qy git && \
    apt install -qy wget && \
# Minimal X environment
    apt install -qy xorg && \
    apt install -qy xinit && \
    apt install -qy openbox && \
#
    apt install -qy x11vnc && \
    apt install -qy xvfb && \
# Installing JDK 21
   wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb && \
   dpkg -i jdk-21_linux-x64_bin.deb && \
   rm jdk-21_linux-x64_bin.deb && \
#
    apt autoclean -qy && \
    apt autoremove -qy



CMD ["x11vnc", "-create", "-forever"]