#!/bin/bash
# Installs projector server under the app user
# @TODO refactor, update IDE versions
IDE="PhpStorm 2020.3.3"

# python3 -m pip install -U pip
/bin/su -c "python3 -m pip install projector-installer" - app

# @TODO autoinstall?
# RUN projector --accept-license --config-directory "${PROJECTOR_CONFIG_DIRECTORY}" \
# 	ide autoinstall \
# 	# --config-name="${PROJECTOR_CONFIG_NAME}" \
# 	--ide-name="${PROJECTOR_APP}" \
# 	# --hostname="${PROJECTOR_HOST}" \
# 	# --port="${PROJECTOR_PORT}"