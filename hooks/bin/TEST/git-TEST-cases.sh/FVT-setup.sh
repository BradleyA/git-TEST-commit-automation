#!/bin/bash
# 	hooks/bin/TEST/git-TEST-cases.sh/FVT-setup.sh  3.1.141.1864  2020-11-21T21:09:33.818020-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.140  
# 	   hooks/EXAMPLES/FVT-option-filename-hooks-012 hooks/bin/TEST/git-TEST-cases.sh/FVT-setup.sh -->   FVT-option-filename-hooks-012 testing  
# 	hooks/bin/TEST/git-TEST-cases.sh/FVT-setup.sh  3.1.140.1863  2020-11-20T22:09:02.548860-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.139-5-gf79d1c2  
# 	   hooks/EXAMPLES/FVT-option-filename-hooks-004 hooks/EXAMPLES/FVT-option-filename-hooks-005 hooks/EXAMPLES/FVT-option-filename-hooks-006 hooks/EXAMPLES/FVT-option-filename-hooks-007 hooks/bin/TEST/git-TEST-cases.sh/FVT-setup.sh -->   testing FVT-option-filename-hooks  
# 	hooks/bin/TEST/git-TEST-cases.sh/FVT-setup.sh  3.1.138.1856  2020-11-20T20:17:13.483098-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.137-1-g50651db  
# 	   hooks/EXAMPLES/FVT-option-filename-hooks-003 hooks/bin/TEST/git-TEST-cases.sh/FVT-setup.sh hooks/bin/git-TEST-cases.sh -->   first code cut for  --filename is used more than once in repository #52  
# 	hooks/bin/TEST/git-TEST-cases.sh/FVT-setup.sh  3.1.137.1854  2020-11-20T16:36:41.792390-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.136-1-g61c9174  
# 	   hooks/EXAMPLES/FVT-option-filename-hooks-001 hooks/bin/TEST/git-TEST-cases.sh/FVT-setup.sh hooks/bin/git-TEST-cases.sh -->   testing FVT-option-filename-hooks-0??  
# 	hooks/bin/TEST/git-TEST-cases.sh/FVT-setup.sh  3.1.127.1840  2020-11-18T14:56:50.028884-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.126-5-g9cddf54  
# 	   hooks/bin/TEST/git-TEST-cases.sh/FVT-setup.sh -->   update FVT-option-filename-00#  
# 	hooks/bin/TEST/git-TEST-cases.sh/FVT-setup.sh  3.1.1.1492  2020-02-03T22:58:57.696458-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 2.527-21-g4424b2b  
# 	   Beta-3 
# 	hooks/bin/TEST/git-TEST-cases.sh/FVT-setup.sh  2.500.1432  2020-02-01T17:23:29.550633-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 2.499  
# 	   hooks/EXAMPLES/FVT-option-clean-hooks-001-004   May not be able to create a test case without creating a new a new git repository  #47 
# 	hooks/EXAMPLES/FVT-setup.sh  2.276.1076  2020-01-21T19:14:19.604461-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  dev  uadmin  five-rpi3b.cptx86.com 2.275  
# 	   FVT-*    Production standard 5.3.559 Copyright 
# 	hooks/EXAMPLES/FVT-setup.sh  2.258.1047  2020-01-19T09:50:49.987834-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  dev  uadmin  five-rpi3b.cptx86.com 2.257  
# 	   hooks/EXAMPLES/FVT-setup.sh   Production standard 5.3.555 Copyright, Production standard 1.3.550 DEBUG variable, ###  Production standard 2.3.529 log format:w 
#86# hooks/EXAMPLES/FVT-setup.sh  -  This test script is optional.  It is for
#    'Production standard 10.0 TESTing' test cases.  Copy it to TEST/<file_name>/.
#    If FVT-setup.sh is found in TEST/<file_name>/ post-commit executes it.
#    Functional Verification Testing (FVT) - verify that the program logic conforms
#    to design specification.
###
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

###  Production standard 10.0 TESTing

if [[ ! -z "${1}" ]] ; then  # post-commit must pass REPOSITORY_DIR because post-commit is executed in .git/hooks/ which is not in the repository
  REPOSITORY_DIR=${1}
else
  REPOSITORY_DIR=$(git rev-parse --show-toplevel)  #  not called by post-commit
  if [[ "${0}" != $(basename "${0}") ]] ; then  #  script must execute in TEST/<COMMIT_FILE_NAME>/ directory
    cd "$(dirname "${0}")"
  fi
fi

#    Uncomment shared TEST cases for TESTing
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-0-001"	FVT-exit-code-error-0-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-1-001"	FVT-exit-code-error-1-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-124-001"	FVT-exit-code-error-124-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-124-002"	FVT-exit-code-error-124-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-126-001"	FVT-exit-code-error-126-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-127-001"	FVT-exit-code-error-127-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-128-001"	FVT-exit-code-error-128-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-130-001"	FVT-exit-code-error-130-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-2-001"	FVT-exit-code-error-2-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-add-001"	FVT-option-add-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-all-001"	FVT-option-all-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-all-002"	FVT-option-all-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-all-hooks-001"	FVT-option-all-hooks-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-all-hooks-002"	FVT-option-all-hooks-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-clean-001"	FVT-option-clean-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-clean-002"	FVT-option-clean-002
# >>>	Known incidnet ## >>>	ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-clean-hooks-001"	FVT-option-clean-hooks-001  #  #47
# >>>	Known incidnet ## >>>	ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-clean-hooks-002"	FVT-option-clean-hooks-002  #  #47
# >>>	Known incidnet ## >>>	ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-clean-hooks-003"	FVT-option-clean-hooks-003  #  #47
# >>>	Known incidnet ## >>>	ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-clean-hooks-004"	FVT-option-clean-hooks-004  #  #47
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-001"    FVT-option-filename-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-001.expected"   FVT-option-filename-001.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-002"    FVT-option-filename-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-002.expected"   FVT-option-filename-002.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-003"    FVT-option-filename-003
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-003.expected"   FVT-option-filename-003.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-004"    FVT-option-filename-004
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-004.expected"   FVT-option-filename-004.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-005"    FVT-option-filename-005
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-005.expected"   FVT-option-filename-005.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-006"    FVT-option-filename-006
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-006.expected"   FVT-option-filename-006.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-007"    FVT-option-filename-007
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-007.expected"   FVT-option-filename-007.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-008"    FVT-option-filename-008
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-008.expected"   FVT-option-filename-008.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-001"      FVT-option-filename-hooks-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-001.expected"     FVT-option-filename-hooks-001.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-002"      FVT-option-filename-hooks-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-002.expected"     FVT-option-filename-hooks-002.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-003"      FVT-option-filename-hooks-003
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-003.expected"     FVT-option-filename-hooks-003.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-004"      FVT-option-filename-hooks-004
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-004.expected"     FVT-option-filename-hooks-004.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-005"      FVT-option-filename-hooks-005
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-005.expected"     FVT-option-filename-hooks-005.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-006"      FVT-option-filename-hooks-006
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-006.expected"     FVT-option-filename-hooks-006.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-007"      FVT-option-filename-hooks-007
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-007.expected"     FVT-option-filename-hooks-007.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-008"      FVT-option-filename-hooks-008
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-008.expected"     FVT-option-filename-hooks-008.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-009"      FVT-option-filename-hooks-009
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-009.expected"     FVT-option-filename-hooks-009.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-010"      FVT-option-filename-hooks-010
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-010.expected"     FVT-option-filename-hooks-010.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-011"      FVT-option-filename-hooks-011
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-011.expected"     FVT-option-filename-hooks-011.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-012"      FVT-option-filename-hooks-012
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-012.expected"     FVT-option-filename-hooks-012.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001"	FVT-option-help-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-002"	FVT-option-help-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-003"	FVT-option-help-003
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-004"	FVT-option-help-004
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-005"	FVT-option-help-005
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-006"	FVT-option-help-006
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-001"	FVT-option-none-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-002"	FVT-option-none-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-hooks-001"	FVT-option-none-hooks-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-hooks-002"	FVT-option-none-hooks-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-hooks-003"	FVT-option-none-hooks-003
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-hooks-004"	FVT-option-none-hooks-004
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-usage-001"	FVT-option-usage-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-usage-002"	FVT-option-usage-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-usage-003"	FVT-option-usage-003
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-usage-004"	FVT-option-usage-004
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-version-001"	FVT-option-version-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-version-002"	FVT-option-version-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-version-003"	FVT-option-version-003
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-version-004"	FVT-option-version-004

#

if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Operation finished..." 1>&2 ; fi
###
