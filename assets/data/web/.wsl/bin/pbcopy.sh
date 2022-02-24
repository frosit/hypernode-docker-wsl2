#!/usr/bin/env bash
#if [[ "$1" == "-h" || "$1" == "--help" || ! ${1:-/dev/stdin+x} ]]; then cat <<HELP
if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
copy

Usage: echo "text" |  $(basename "$0")
Usage: $(basename "$0") "file.ext"

Copyright (c) 2018 "FROSIT" Fabio Ros
Licensed under the MIT license.
http://frosit.nl
HELP
exit; fi

# echo -e "${1}"
# get file path


function log(){
    echo -e "$1" >> log.txt
}

# get input arg or set stdin
INP_VAR=${1:-/dev/stdin}
FILE=$(pwd)/$1

# if no arg, catch stdin
if  [[ ! ${1+x} ]]; then
    INP_VAR=$(cat $INP_VAR)
fi

# if arg is a file, take contents
if [[ -f ${1} ]]; then
    INP_VAR=$(cat ${1})
fi

echo "${INP_VAR}" | clip.exe

# echo -e "Copied: $INP_VAR"