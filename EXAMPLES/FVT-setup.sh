#!/bin/bash
# 	hooks/EXAMPLES/FVT-setup.sh  3.335.573  2019-08-18T21:25:54.808725-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.334-1-gb85dde4  
# 	   hooks/EXAMPLES/FVT-setup.sh hooks/EXAMPLES/SAST-setup.sh add commond test cases with ln 
# 	hooks/EXAMPLES/FVT-setup.sh  3.313.542  2019-08-17T09:52:21.914768-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.312  
# 	   moved into EXAMPLES directory 
###
#	FVT-setup.sh -  This script is optional.  It runs before test cases are run, if FVT-setup.sh is found in TEST/<file_name>/
#	   Functional Verification Testing (FVT) - verify that the program logic conforms to design specification.
#	   FVT attempts to answer the question "Does this program logic do what is intended?"
#
#### production standard 3.0 shellcheck
#### production standard 5.1.160 Copyright
##       Copyright (c) 2019 Bradley Allen
##       MIT License is in the online DOCUMENTATION, DOCUMENTATION URL defined below.
###
#       Remove output from previous run of test cases
rm -f FVT-*.test-case-output
#
### production standard 10.0 TESTing 
REPOSITORY_DIR=$(git rev-parse --show-toplevel)
#	Add shared TEST cases with command
#	   uncomment the test case to be tested
#	FVT
#	ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001 ./FVT-option-help-001
#	ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001 ./FVT-option-help-001
#	ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001 ./FVT-option-help-002
#	ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001 ./FVT-option-help-003
#	ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001 ./FVT-option-help-004
#	ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001 ./FVT-option-help-005
#	ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001 ./FVT-option-help-006
#	ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001 ./FVT-option-usage-001
#	ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001 ./FVT-option-usage-002
#	ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001 ./FVT-option-usage-003
#	ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001 ./FVT-option-version-001
#	ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001 ./FVT-option-version-002
#	ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001 ./FVT-option-version-003

#	Create symbolic link for all test case expected output that matches another test case expected output 
#	Expected output from FVT-option-help-001 matches output from FVT-option-help-00[2,3,4,5,6]
ln -fs FVT-option-help-001.expected FVT-option-help-002.expected
ln -fs FVT-option-help-001.expected FVT-option-help-003.expected
ln -fs FVT-option-help-001.expected FVT-option-help-004.expected
ln -fs FVT-option-help-001.expected FVT-option-help-005.expected
ln -fs FVT-option-help-001.expected FVT-option-help-006.expected
#	Expected output from FVT-option-usage-001 matches output from FVT-option-usage-00[2,3]
ln -fs FVT-option-usage-001.expected FVT-option-usage-002.expected
ln -fs FVT-option-usage-001.expected FVT-option-usage-003.expected 
#	Expected output from FVT-option-version-001 matches output from FVT-option-version-00[2,3]
ln -fs FVT-option-version-001.expected FVT-option-version-002.expected
ln -fs FVT-option-version-001.expected FVT-option-version-003.expected
###		
