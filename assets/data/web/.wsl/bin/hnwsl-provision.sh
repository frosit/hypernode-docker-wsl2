#!/usr/bin/env bash
# @todo autostart
if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
Provisions your VM

Usage: $(basename "$0") -f (force)

This command will perform various actions on boot, it will look for a .hdx-prov file.
If this file exists, provisioning will be skipped, otherwise executed.

Copyright (c) 2018 "FROSIT" Fabio Ros
Licensed under the MIT license.
http://frosit.nl
HELP
exit; fi

# Exit if provision flag exists
if [[ -f /data/web/.wsl-prov && ${1} != "-f" ]]; then
    exit
fi


if [[ -d "/data/web/.wsl/provision" ]]; then
    for item in $(ls /data/web/.wsl/provision/*.sh); do
        . ${item}
    done
fi