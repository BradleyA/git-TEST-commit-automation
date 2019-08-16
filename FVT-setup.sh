#!/bin/bash
# 	hooks/FVT-setup.sh  3.264.508  2019-08-16T14:35:19.798883-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.263  
# 	   hooks/FVT-setup.sh added SAST test cases #26 
# 	hooks/FVT-setup.sh  3.264.508  2019-08-16T14:34:43.536825-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.263  
# 	   hooks/FVT-setup.sh added SAST test cases 
# 	template/TEST/template.sh/FVT-setup.sh  3.263.507  2019-08-16T14:09:18.293030-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.262-2-gc1be0e1  
# 	   hooks/post-commit add SAST testing #26 
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
