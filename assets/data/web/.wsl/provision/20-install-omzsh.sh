#!/bin/bash
# Installs ZSH + oh-my-zsh + plugins etc...
# @TODO add .zshrc under root
set -e

git clone https://github.com/ohmyzsh/ohmyzsh /data/web/.oh-my-zsh

# install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions /data/web/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting /data/web/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions /data/web/.oh-my-zsh/custom/plugins/zsh-completions

chown -R app:app /data/web/.oh-my-zsh

# change default shell
#sed -i -e "s#bin/bash#bin/zsh#" /etc/passwd