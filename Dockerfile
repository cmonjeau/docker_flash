############################################################
# Dockerfile to build flash 1.2.11 software
# Based on debian wheezy
############################################################

# Set the base image to debian wheezy
FROM debian:wheezy

# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive
ENV PACKAGES wget make cmake gcc g++ python-dev

########################### FLASH URLS #############################

ENV FLASH_SOURCE http://sourceforge.net/projects/flashpage/files/FLASH-1.2.11.tar.gz/download
ENV FLASH_DIR FLASH-1.2.11
ENV DIR /opt

################## DEPENDENCIES INSTALLATION ######################

RUN apt-get update -y
RUN apt-get install -y ${PACKAGES}

################## FLASH INSTALLATION ######################

WORKDIR ${DIR}
RUN wget ${FLASH_SOURCE} -O - | tar xvzf -
WORKDIR ${DIR}/${FLASH_DIR}
RUN make

RUN cp flash /usr/local/bin/

WORKDIR /root

RUN rm -r ${DIR}/${FLASH_DIR}

###############################################################

MAINTAINER Monjeaud Cyril <Cyril.Monjeaud@irisa.fr>

