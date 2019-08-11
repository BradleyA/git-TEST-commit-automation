#!/bin/bash
# 	hooks/SVT-setup.sh  3.250.dev#26-001.477  2019-08-11T18:21:29.914387-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.248  
# 	   hooks/SVT-setup.sh  cp FVT-setup.sh SVT-setup.sh 
###
#	FVT-setup.sh -  This script is optional.  It runs before test cases are run, if FVT-setup.sh is found in TEST/<file_name>/
#
### production standard 3.0 shellcheck
### production standard 5.1.160 Copyright
##       Copyright (c) 2019 Bradley Allen
##       MIT License is in the online DOCUMENTATION, DOCUMENTATION URL defined below.
### production standard 10.0 FVT testing
#       Remove output from previous run of test cases
rm -f FVT-*.test-case-output
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
