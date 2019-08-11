#!/bin/bash
# 	hooks/SVT-setup.sh  3.250.dev#26-002.478  2019-08-11T18:34:28.209998-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.250.dev#26-001  
# 	   hooks/SVT-setup.sh cleanup 
# 	hooks/SVT-setup.sh  3.250.dev#26-001.477  2019-08-11T18:21:29.914387-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.248  
# 	   hooks/SVT-setup.sh  cp FVT-setup.sh SVT-setup.sh 
###
#	SVT-setup.sh -  This script is optional.  It runs before test cases are run, if SVT-setup.sh is found in TEST/<file_name>/
#
### production standard 3.0 shellcheck
### production standard 5.1.160 Copyright
##       Copyright (c) 2019 Bradley Allen
##       MIT License is in the online DOCUMENTATION, DOCUMENTATION URL defined below.
### production standard 10.0 SVT testing
#       Remove output from previous run of test cases
rm -f SVT-*.test-case-output
