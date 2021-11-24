FROM docker.hypernode.com/byteinternet/hypernode-buster-docker
LABEL MAINTAINER="Fabio Ros <fabio@frosit.nl>"

### Setup user permissions
# pass env variables
ENV DEFAULT_APP_PWD app
ENV DEFAULT_ROOT_PWD root

# change passwds
RUN echo "root:${DEFAULT_ROOT_PWD:-root}" | chpasswd && echo "app:${DEFAULT_APP_PWD:-app}" | chpasswd
# Give sudo permissions, both?
RUN usermod -aG sudo app
RUN usermod -aG root app

### Provisioning (app:app = 1000:1000)
# add .wsl provisioning dir
ADD --chown=1000:1000 assets/data/web/.wsl /data/web/.wsl
# add default .projector config
ADD --chown=1000:1000 assets/data/web/.projector /data/web/.projector

# add custom aliases
ADD --chown=1000:1000 assets/data/web/.bash_aliases /data/web/

# add / overwrite to source custom .wsl package
ADD --chown=1000:1000 assets/data/web/.profile /data/web/
ADD --chown=1000:1000 assets/data/web/.zshrc /data/web/
ADD --chown=1000:1000 assets/data/web/.my.cnf /data/web/

# add wsl config to set default user
ADD assets/etc/wsl.conf /etc/wsl.conf
# overwrite profile to fix paths on debian
ADD assets/etc/profile /etc/profile

# run provisioning scripts
RUN /data/web/.wsl/bin/hnwsl-provision.sh