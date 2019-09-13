#!/bin/bash
# 	hooks/bin/uninstall-git-TEST-cases.sh  2.68.502  2019-09-13T15:32:21.586542-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.67-5-gc55308b  
# 	   hooks/bin/uninstall-git-TEST-cases.sh hooks/bin/setup-git-TEST-cases.sh update for name change from check-git-TEST-cases.sh to list-git-TEST-cases.sh 
# 	hooks/bin/uninstall-git-TEST-cases.sh  2.61.462  2019-09-10T20:06:29.817892-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.60-17-g46bae0a  
# 	   close #20  hooks/bin/uninstall-git-TEST-cases.sh   correct incident with not removing TEST directory 
#86# hooks/bin/uninstall-git-TEST-cases.sh - uninstall git TEST cases in current repository
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

#    INFO
if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "INFO" "  Started..." 1>&2 1>&2 ; fi

###

if git -C . rev-parse 2> /dev/null ; then  #  currect directory in a git repository
  cd "$(git rev-parse --show-toplevel || echo '.')"  #  change to top git repository directory 
  #    Tar copy of ./hooks into /tmp after a day should auto delete . . . someday I will want this back and  quick!
  TMP_FILE_1=$(mktemp)    #  create temporary file
  TMP_FILE_2=$(mktemp)    #  create temporary file
  TMP_FILE_3=$(mktemp)    #  create temporary file
  TMP_FILE_2s=$(mktemp)   #  create temporary file
  TMP_FILE_3s=$(mktemp)   #  create temporary file
  find . -path '*TEST'   | grep -v './hooks' >  "${TMP_FILE_2}"  #  All TEST directores not under hooks directory #20
  find . -path '*TEST/*' | grep -v './hooks' >> "${TMP_FILE_2}"  #  ALL TEST directory subdirectories and files not under hooks directory
  if [[ -d hooks ]] ; then 
    find ./hooks  >  "${TMP_FILE_3}"  #  ALL files and directories under hooks
  fi
  tar -rf "${TMP_FILE_1}.tar" --files-from "${TMP_FILE_2}" --files-from "${TMP_FILE_3}"

#    Remove TEST directories, subdirectories, and files not under hooks directory
  sort -r "${TMP_FILE_2}" > "${TMP_FILE_2s}"  #  remove files before directories
  while read -r name ; do
    if git ls-files --error-unmatch "$name" 2> /dev/null ; then
      git rm -f "$name"   #  Remove tracked file
    else
      if [[ -d "${name}" ]] ; then 
        rmdir "${name}"   #  Remove untracked directory
      else
        rm -f "${name}"   #  Remove untracked file
      fi 
    fi
  done <  "${TMP_FILE_2s}"

#    Remove hooks/ directory, subdirectories, and files
  sort -r "${TMP_FILE_3}" > "${TMP_FILE_3s}"  # remove files before directories
  while read -r name ; do
    if git ls-files --error-unmatch "${name}" 2> /dev/null ; then
      git rm -f "${name}" #  Remove tracked file
    else
      if [[ -d "${name}" ]] ; then 
        rmdir "${name}"   #  Remove untracked directory
      else
        rm -f "${name}"   #  Remove untracked file
      fi 
    fi
  done <  "${TMP_FILE_3s}"
#
  rm -f  .git/hooks/pre-commit
  rm -f  .git/hooks/post-commit
  rm -f  /usr/local/bin/list-git-TEST-cases.sh
  rm -f  /usr/local/bin/setup-git-TEST-cases.sh
  rm -f  /usr/local/bin/uninstall-git-TEST-cases.sh
  mv "${TMP_FILE_1}.tar" .  #  #20   place the tar file in the repository top directory not /tmp
  git commit -m 'remove git-TEST-commit-automation  hooks recursively'
#  git push
#
else
  EXIT_CODE=${?}
  new_message "${SCRIPT_NAME}" "${LINENO}" "ERROR" "  The current directory, ($(pwd)), is Not a git repository (or any of the parent directories)." 1>&2
  exit ${EXIT_CODE}
fi

# >>>  consider adding a user hint and include link to README.md  . . .  to answer that question, what now (WTF)  . . .  I forgot, hadn't done this in six months, quick!  . . .  is there a backup?  where?  . . .  are all the files and directories gone?  yep!
# >>>  A copy of the files can be found in "${TMP_FILE_1}.tar" for les than 24 hours  . . .   I don't know when

#		
if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "INFO" "  Operation finished..." 1>&2 ; fi
###
