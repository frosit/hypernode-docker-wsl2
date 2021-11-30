#!/bin/bash
# apt update & installation of required packages
# @TODO version specifications
set -e

# update
sudo apt update

# install basics
sudo apt install  \
    less libxext6 libxrender1 libxtst6 libfreetype6 libxi6 \
    dbus-x11 dialog x11-utils libgbm1 socat \
    php-xdebug \
    zsh pv htop fuse -y

