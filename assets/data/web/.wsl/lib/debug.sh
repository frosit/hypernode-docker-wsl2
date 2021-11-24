#!/usr/bin/env bash
###################
# Debug & Logging lib
# ===================
# Generic functions for logging and debugging
#
# To Do:
# @todo set commands in env
# ####

# Debug & Logging
HNWSL_DEBUG=${HNWSL_DEBUG:-true}
HNWSL_LOG=true # or false
HNWSL_LOG_FILE=${HOME}/.hnwsl.log

#######################################
# Log a message
# GLOBALS
# HNWSL_DEBUG
# HNWSL_LOG
# HNWSL_LOG_FILE
# ARGUMENTS:
# message
# log level (optional)
# TO DO:
# @todo in some cases, messages are doubled
#######################################
function hnwsl::log(){
    local datetime=$(date '+%d-%m-%Y-%H:%M:%S'); # Datetime format
    local msg="${1}"; shift # message
    local lvl=NOTICE # default level
    if [[ -n ${1+x} ]]; then # if level, set level
        local lvl=$1 # @todo handle levels
    fi

    # Output message
    if [[ -n ${HNWSL_DEBUG+x} && ${HNWSL_DEBUG} == true ]]; then
        echo -e "${datetime}[${lvl}] -- ${msg}"
    fi

    # Write message
    if [[ -n ${HNWSL_DEBUG+x} && ${HNWSL_DEBUG} == true && ${HNWSL_LOG} == true ]]; then
        echo -e "${datetime}[${lvl}] -- ${msg}" >> ${HNWSL_LOG_FILE}
    fi
}

# Shorthand for error
function hnwsl::warning(){
    hnwsl::log "${1}" "WARNING"
}

# Shorthand for error
function hnwsl::error(){
    hnwsl::log "${1}" "ERROR"
}

# Shorthand for error
function hnwsl::exception(){
    hnwsl::log "${1}" "EXCEPTION"
}