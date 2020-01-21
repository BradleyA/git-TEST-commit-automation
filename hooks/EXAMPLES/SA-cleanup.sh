#!/bin/bash
# 	hooks/EXAMPLES/SA-cleanup.sh  2.272.1072  2020-01-21T15:24:20.635910-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  dev  uadmin  five-rpi3b.cptx86.com 2.271-2-gaeeaa5a  
# 	   hooks/EXAMPLES/FVT-cleanup.sh hooks/EXAMPLES/SA-cleanup.sh  correct incidents found with shellcheck 
# 	hooks/EXAMPLES/SA-cleanup.sh  2.264.1055  2020-01-19T11:30:08.104069-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  dev  uadmin  five-rpi3b.cptx86.com 2.263-1-gaab55e2  
# 	   hooks/EXAMPLES/SA-cleanup.sh   test changes to output 
# 	hooks/EXAMPLES/SA-cleanup.sh  2.263.1053  2020-01-19T11:28:04.981423-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  dev  uadmin  five-rpi3b.cptx86.com 2.262-1-gbd566e8
# 	   hooks/EXAMPLES/SA-cleanup.sh   Production standard 5.3.555 Copyright, Production standard 1.3.550 DEBUG variable, ###  Production standard 2.3.529 log format 
# 	hooks/EXAMPLES/SA-cleanup.sh  2.192.851  2019-10-02T12:14:57.960077-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.191  
# 	   hooks/EXAMPLES/SA-shellcheck-001   incident with cp changed to cp -f 
# 	hooks/EXAMPLES/SA-cleanup.sh  2.138.787  2019-09-27T12:33:27.537389-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.137  
# 	   close #34    EXAMPLES/SA-* FVT-*   added NO -x ${1} exit ERROR 126 
#86# hooks/EXAMPLES/SA-cleanup.sh  -  test case cleanup
###  Production standard 3.0 shellcheck
###  Production standard 5.3.555 Copyright                                    # 3.555
#    Copyright (c) 2020 Bradley Allen                                         # 3.555
#    MIT License is online in the repository as a file named LICENSE          # 3.555
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

###  Place test case cleanup here 

#    Remove environment variables
#  unset DEBUG
#    Remove directories
rm -rf tmp
#    Remove output from previous run of test cases
rm -f SA-*.test-case-output
#    Remove temporary files
#  rm -f temporary files
#    Remove linked SA-* files except SA-cleanup.sh and SA-setup.sh
for k in $(ls -1 SA-*) ; do
  if [[ "${k}" != "SA-cleanup.sh" ]] ; then
    if [[ "${k}" != "SA-setup.sh" ]] ; then
      { [[ ! -L "${k}" ]] || rm "${k}"; }  #  Remove files with symbolic link
      if [[ ! -s "${k}" ]] ; then  #  Remove FVT-test-case.expected that has a size of zero
        if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "DEBUG" "  Empty file ${k}" 1>&2 ; fi
        if [[ "${k##*.}" == "expected" ]] ; then
          if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "DEBUG" "  File ${k} has expected extension >${k##*.}<" 1>&2 ; fi
          rm "${k}"
        fi
      fi

    fi
  fi
done

if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Operation finished..." 1>&2 ; fi
###
