#!/bin/bash
# install required ubuntu wsl packages
# @TODO add package repo? or ensure packages are up to date
set -e

# install wsl libs
curl http://de.archive.ubuntu.com/ubuntu/pool/main/w/wslu/wslu_2.3.2-0ubuntu2~18.04.3_all.deb -o wslu.deb
sudo dpkg -i wslu.deb
rm wslu.deb

curl http://de.archive.ubuntu.com/ubuntu/pool/main/u/ubuntu-meta/ubuntu-wsl_1.417.5_amd64.deb -o ubuntu-wsl.deb
sudo dpkg -i ubuntu-wsl.deb
rm ubuntu-wsl.deb

# @todo modify paths