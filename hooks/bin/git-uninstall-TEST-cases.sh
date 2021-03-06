#!/bin/bash
# 	hooks/bin/git-uninstall-TEST-cases.sh  3.1.286.2058  2020-12-08T12:09:55.890646-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.285  
# 	   hooks/bin/git-uninstall-TEST-cases.sh hooks/post-commit -->   update comments  
# 	hooks/bin/uninstall-git-TEST-cases.sh  3.1.126.1834  2020-11-18T13:46:55.038582-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.125  
# 	   hooks/bin/git-TEST-cases.sh hooks/bin/git-setup-TEST-cases.sh hooks/bin/uninstall-git-TEST-cases.sh -->   rename git-TEST-setup-cases.sh -> git-setup-TEST-cases.sh  
# 	hooks/bin/uninstall-git-TEST-cases.sh  2.443.1337  2020-01-29T11:21:10.587150-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 2.442-2-g61001a8  
# 	   hooks/bin/uninstall-git-TEST-cases.sh   added No --help section 
# 	hooks/bin/uninstall-git-TEST-cases.sh  2.282.1135  2020-01-22T11:55:42.740309-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  dev  uadmin  five-rpi3b.cptx86.com 2.281  
# 	   hooks/bin/uninstall-git-TEST-cases.sh    Production standard 5.3.559 Copyright, Production standard 1.3.550 DEBUG variable,  Production standard 2.3.529 log format 
# 	hooks/bin/uninstall-git-TEST-cases.sh  2.124.642  2019-09-21T18:04:40.873567-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.123-14-gda8ab89
# 	   #15   hooks/bin/uninstall-git-TEST-cases.sh  change tmp.*.tar location 
# 	hooks/bin/uninstall-git-TEST-cases.sh  2.115.616  2019-09-20T20:24:59.499282-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.114  
# 	   close #15   hooks/bin/uninstall-git-TEST-cases.sh   added message about location of tmp backup of all test cases 
#86# hooks/bin/uninstall-git-TEST-cases.sh  -  uninstall git TEST cases in current repository
###  Production standard 3.0 shellcheck
###  Production standard 5.3.559 Copyright                                    # 3.559
#    Copyright (c) 2020 Bradley Allen                                                # 3.555
#    MIT License is online in the repository as a file named LICENSE"         # 3.559
###  Production standard 1.3.550 DEBUG variable                                             # 3.550
#    Order of precedence: environment variable, default code
if [[ "${DEBUG}" == ""  ]] ; then DEBUG="0" ; fi   # 0 = debug off, 1 = debug on, 'export DEBUG=1', 'unset DEBUG' to unset environment variable (bash)
if [[ "${DEBUG}" == "2" ]] ; then set -x    ; fi   # Print trace of simple commands before they are executed
if [[ "${DEBUG}" == "3" ]] ; then set -v    ; fi   # Print shell input lines as they are read
if [[ "${DEBUG}" == "4" ]] ; then set -e    ; fi   # Exit immediately if non-zero exit status
if [[ "${DEBUG}" == "5" ]] ; then set -e -o pipefail ; fi   # Exit immediately if non-zero exit status and exit if any command in a pipeline errors
#
BOLD=$(tput -Txterm bold)
NORMAL=$(tput -Txterm sgr0)
RED=$(tput    setaf 1)
YELLOW=$(tput setaf 3)
WHITE=$(tput  setaf 7)

#    Date and time function ISO 8601
get_date_stamp() {
  DATE_STAMP=$(date +%Y-%m-%dT%H:%M:%S.%6N%:z)
  TEMP=$(date +%Z)
  DATE_STAMP="${DATE_STAMP} (${TEMP})"
}

#    Fully qualified domain name FQDN hostname
LOCALHOST=$(hostname -f)

#    Version
#    Assumptions for the next two lines of code:  The second line in this script includes the script path & name as the second item and
#    the script version as the third item separated with space(s).  The tool I use is called 'markit'. See example line below:
#       template/template.sh  3.517.783  2019-09-13T18:20:42.144356-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.516  
SCRIPT_NAME=$(head -2 "${0}" | awk '{printf $2}')  #  Different from ${COMMAND_NAME}=$(echo "${0}" | sed 's/^.*\///'), SCRIPT_NAME = includes Git repository directory and can be used any where in script (for dev, test teams)
SCRIPT_VERSION=$(head -2 "${0}" | awk '{printf $3}')
if [[ "${SCRIPT_NAME}" == "" ]] ; then SCRIPT_NAME="${0}" ; fi
if [[ "${SCRIPT_VERSION}" == "" ]] ; then SCRIPT_VERSION="v?.?" ; fi

#    GID
GROUP_ID=$(id -g)

###  Production standard 2.3.529 log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)
new_message() {  #  $1="${LINENO}"  $2="DEBUG INFO ERROR WARN"  $3="message"
  get_date_stamp
  echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${SCRIPT_NAME}[$$] ${SCRIPT_VERSION} ${1} ${USER} ${UID}:${GROUP_ID} ${BOLD}[${2}]${NORMAL}  ${3}"
}

#    INFO
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "  Started..." 1>&2 ; fi

#    No --help
if [[ "${1}" != "" ]] ; then
  new_message "${LINENO}" "${RED}ERROR${WHITE}" "  ${SCRIPT_NAME} does not support arguements." 1>&2
  #    User Hint
  echo -e "    For more information:\n${BOLD}${YELLOW}    https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks#git-test-commit-automation------\n${NORMAL}"
  exit 1
fi

###

if git -C . rev-parse 2> /dev/null ; then  #  currect directory in a git repository
  cd "$(git rev-parse --show-toplevel || echo '.')"  #  change to top git repository directory 
  #    Tar copy of ./hooks into /tmp after a day should auto delete . . . someday I will want this back and  quick! where is it ?
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
  #    Backup TEST directories, subdirectories, and files
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
  # >>>  need a ticket to add an options for git push with environment variable
  # >>>  git push
  # >>>  add command for testing manually need to set enviroment variables first
  rm -f  /usr/local/bin/git-TEST-cases.sh
  rm -f  /usr/local/bin/git-setup-TEST-cases.sh
  rm -f  /usr/local/bin/uninstall-git-TEST-cases.sh
  mv "${TMP_FILE_1}.tar" .  #  #20   place the tar file in the repository top directory not /tmp
  git commit -m 'remove git-TEST-commit-automation  hooks recursively'
else
  EXIT_CODE=${?}
  new_message "${LINENO}" "${RED}ERROR${WHITE}" "  The current directory, ($(pwd)), is Not a git repository (or any of the parent directories)." 1>&2
  exit ${EXIT_CODE}
fi

echo    "    A copy of files can be found in ${TMP_FILE_1}.tar in the top directory of the Git repository." #  #15

#		
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "  Operation finished..." 1>&2 ; fi
###
