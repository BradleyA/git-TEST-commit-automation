#!/bin/bash
#86# FVT-cleanup.sh - test case cleanup
###  Production standard 3.0 shellcheck
###  Production standard 5.1.160 Copyright
#    Copyright (c) 2019 Bradley Allen
#    MIT License is in the online DOCUMENTATION, DOCUMENTATION URL defined below.
###  Production standard 1.3.496 DEBUG variable
#    Order of precedence: environment variable, default code
if [[ "${DEBUG}" == ""  ]] ; then DEBUG="0" ; fi   # 0 = debug off, 1 = debug on, 'export DEBUG=1', 'unset DEBUG' to unset environment variable (bash)
if [[ "${DEBUG}" == "2" ]] ; then set -x    ; fi   # Print trace of simple commands before they are executed
if [[ "${DEBUG}" == "3" ]] ; then set -v    ; fi   # Print shell input lines as they are read
if [[ "${DEBUG}" == "4" ]] ; then set -e    ; fi   # Exit command has a non-zero exit status
#
BOLD=$(tput -Txterm bold)
NORMAL=$(tput -Txterm sgr0)
#    Date and time function ISO 8601
get_date_stamp() {
  DATE_STAMP=$(date +%Y-%m-%dT%H:%M:%S.%6N%:z)
  TEMP=$(date +%Z)
  DATE_STAMP="${DATE_STAMP} (${TEMP})"
}

#    Fully qualified domain name FQDN hostname
LOCALHOST=$(hostname -f)

#    Version
SCRIPT_NAME=$(head -2 "${0}" | awk '{printf $2}')
SCRIPT_VERSION=$(head -2 "${0}" | awk '{printf $3}')

#    UID and GID
USER_ID=$(id -u)
GROUP_ID=$(id -g)

###  Production standard 2.3.512 log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)
new_message() {  #  $1="${SCRIPT_NAME}"  $2="${LINENO}"  $3="DEBUG INFO ERROR WARN"  $4="message"
  get_date_stamp
  echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${1}[$$] ${SCRIPT_VERSION} ${2} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[${3}]${NORMAL}  ${4}"
}

if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "DEBUG" "  Started..." 1>&2 ; fi

###  Place test case cleanup here

#    Remove environment variables
#  unset
#    Remove directories
#  rmdir
#    Remove output from previous run of test cases
rm -f FVT-*.test-case-output
#    Remove temporary files
#  rm -f temporary files
rm -f FVT-option-version-001.expected
#    Remove linked FVT-* files except FVT-cleanup.sh and FVT-setup.sh
for k in $(ls -1 FVT-*) ; do
  if [[ "${k}" != "FVT-cleanup.sh" ]] ; then
    if [[ "${k}" != "FVT-setup.sh" ]] ; then
      { [ ! -L "${k}" ] || rm -v "${k}"; }  #  Remove files with symbolic link
    fi
  fi
done

if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "INFO" "  Operation finished..." 1>&2 ; fi
###
