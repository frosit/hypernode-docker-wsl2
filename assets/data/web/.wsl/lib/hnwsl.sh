#!/usr/bin/env bash
###################
# Debug & Logging lib
# ===================

#######################################
# Log a message
# create winhome
#######################################
function hnwsl::setwinhome(){

  ENV_SET=$(cat $HOME/.wsl/.env | grep -q HNWSL_WIN_USERDIR)
    if [ $? -eq 1   ]; then # has no keys
      echo -e "HNWSL_WIN_USERDIR env var not set, writing to .env"
      export HNWSL_WIN_USERDIR=$(wslpath $(wslvar USERPROFILE))
      echo -e "HNWSL_WIN_USERDIR=${HNWSL_WIN_USERDIR}" >> $HOME/.wsl/.env
    fi

  if [[ ! -d $HOME/winhome ]]; then
    echo -e "linking home dir"
    ln -s $HNWSL_WIN_USERDIR $HOME/winhome
    fi

}