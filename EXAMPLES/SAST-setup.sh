#!/bin/bash
# 	hooks/EXAMPLES/SAST-setup.sh  3.335.573  2019-08-18T21:25:54.937316-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.334-1-gb85dde4  
# 	   hooks/EXAMPLES/FVT-setup.sh hooks/EXAMPLES/SAST-setup.sh add commond test cases with ln 
# 	hooks/SAST-setup.sh  3.303.530  2019-08-16T16:41:54.923689-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.302-1-gf0d1209  
# 	   hooks/SAST-setup.sh  initial commit after testing in post-commit 
###
#	SAST-setup.sh -  This script is optional.  It runs before test cases are run, if SAST-setup.sh is found in TEST/<file_name>/
#	   Static Analysis Software Testing (SAST) - examination of the code prior to the program’s execution
#	   SAST is code analysis, syntax, permission, code inspection, code review, data flow analysis, and
#	   walkthrough (manually reviewing algorithms as well as documents to find any errors).
#### production standard 3.0 shellcheck
#### production standard 5.1.160 Copyright
##       Copyright (c) 2019 Bradley Allen
##       MIT License is in the online DOCUMENTATION, DOCUMENTATION URL defined below.
###
#       Remove output from previous run of test cases
rm -f SAST-*.test-case-output
#
### production standard 10.0 TESTing 
REPOSITORY_DIR=$(git rev-parse --show-toplevel)
#       Add shared TEST cases with command
#          uncomment the test case to be tested
#       SAST
#       ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-permission-644-001 SAST-permission-644-001
#       ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-permission-755-001 SAST-permission-755-001
ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-permission-775-001 SAST-permission-775-001
ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-shellcheck-001 SAST-shellcheck-001
###		
