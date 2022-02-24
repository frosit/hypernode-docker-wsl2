#!/bin/bash
# install required ubuntu wsl packages
# @TODO add package repo? or ensure packages are up to date
set -e

# @TODO replace with
# https://github.com/wslutilities/wslu
wget -O - https://pkg.wslutiliti.es/public.key | sudo tee -a /etc/apt/trusted.gpg.d/wslu.asc
echo "deb https://pkg.wslutiliti.es/debian buster main" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install wslu -y
