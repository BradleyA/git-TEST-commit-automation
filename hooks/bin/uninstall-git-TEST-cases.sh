#!/bin/bash
# 	hooks/bin/uninstall-git-TEST-cases.sh  2.39.323  2019-09-02T23:08:57.145383-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.38  
# 	   hooks/bin/uninstall-git-TEST-cases.sh  add code to check if ./hooks directory before running find on hooks :-) 
# 	hooks/bin/uninstall-git-TEST-cases.sh  2.38.322  2019-09-02T22:50:18.870628-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.37-1-gc4d73f1  
# 	   hooks/bin/uninstall-git-TEST-cases.sh  draft removing files 
# 	hooks/bin/uninstall-git-TEST-cases.sh  2.37.320  2019-09-02T22:29:04.434909-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.36  
# 	   hooks/bin/uninstall-git-TEST-cases.sh  add code to rmdir directories 
# 	hooks/bin/uninstall-git-TEST-cases.sh  2.35.318  2019-09-02T22:00:29.469045-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.34  
# 	   hooks/bin/uninstall-git-TEST-cases.sh  working draft 
# 	hooks/bin/uninstall-git-TEST-cases.sh  2.34.317  2019-09-02T19:48:26.610128-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.33-1-g77236a1  
# 	   hooks/bin/uninstall-git-TEST-cases.sh  second draft 
# 	hooks/bin/uninstall-git-TEST-cases.sh  2.33.315  2019-09-02T17:19:59.393951-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.32  
# 	   hooks/bin/uninstall-git-TEST-cases.sh  draft test 
###  hooks/bin/uninstall-git-TEST-cases.sh - uninstall git TEST cases in current repository
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
SCRIPT_VERSION=$(head -2 "${0}" | awk '{printf $3}')

if [[ "${DEBUG}" == "1" ]] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Operation started." 1>&2 ; fi

###

if git -C . rev-parse 2> /dev/null ; then  #  currect directory in a git repository
  cd "$(git rev-parse --show-toplevel || echo '.')"  #  change to top git repository directory 
  #    Tar copy of ./hooks into /tmp after a day should auto delete . . . someday I will want this back and  quick!
  TMP_FILE_1=$(mktemp)    #  create temporary file
  TMP_FILE_2=$(mktemp)    #  create temporary file
  TMP_FILE_3=$(mktemp)    #  create temporary file
  TMP_FILE_2s=$(mktemp)   #  create temporary file
  TMP_FILE_3s=$(mktemp)   #  create temporary file
  find . -path '*TEST/*' | grep -v './hooks'  >  "${TMP_FILE_2}"  #  ALL TEST directories and file not under hooks
  if [[ -d hooks ]] ; then 
    find ./hooks  >  "${TMP_FILE_3}"  #  ALL files and directories under hooks
  fi
  tar -rf "${TMP_FILE_1}.tar" --files-from "${TMP_FILE_2}" --files-from "${TMP_FILE_3}"

#    git rm -r hooks
  sort -r "${TMP_FILE_2}" > "${TMP_FILE_2s}"
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

#    git rm -r hooks
  sort -r "${TMP_FILE_3}" > "${TMP_FILE_3s}"
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
  rm -f  /usr/local/bin/check-git-TEST-cases.sh
  rm -f  /usr/local/bin/setup-git-TEST-cases.sh
  rm -f  /usr/local/bin/uninstall-git-TEST-cases.sh

#		git commit -m 'remove git-TEST-commit-automation  hooks recursively'
#		git push
fi

# >>>  consider adding a user hint and include link to README.md  . . .  to answer that question, what now (WTF)  . . .  shit I forgot, hadn't done this in six months, quick!  . . . . . .
# >>>  A copy of the files can be found in "${TMP_FILE_1}.tar"

#		
if [[ "${DEBUG}" == "1" ]] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Operation finished." 1>&2 ; fi
###
