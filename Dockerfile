FROM ubuntu:latest

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install OpenJDK 11 headless
RUN apt update 

RUN apt install -y wget software-properties-common gnupg 


# Add PostgreSQL official repository
RUN wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list


# JAVA 11 (temurin) repozitar
RUN wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
RUN echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list


RUN apt update && apt install -y \
    postgresql-client-13 \
    postgresql-contrib \
    xdg-utils 

RUN apt install -y  tcl tcl-tls tcl8.6 tcllib tk tk8.6 ucf xz-utils vim  temurin-11-jre

RUN apt install -y xrdp x11vnc

RUN rm -rf /var/lib/apt/lists/*

RUN wget https://www.flexibee.eu/download/latest/deb/client -O abra_flexi_client.deb
RUN dpkg -i abra_flexi_client.deb

RUN echo "#!/bin/sh\n/usr/bin/flexibee" > /etc/xrdp/startwm.sh &&  chmod +x /etc/xrdp/startwm.sh
RUN useradd -m -s /bin/bash pou
RUN echo 'pou:pou' | chpasswd


# Run
CMD service xrdp stop && service xrdp start 

