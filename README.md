# in development

**WARNING**: These instructions are incomplete. Consider them as notes quickly drafted on a napkin rather than proper documentation!

# Production standard 10.0 FVT testing

The strategy of these scripts is to assist with running a command and then checking the output, or exit code.  Did the command function as designed? 

When the testing is complete, PASS or FAIL, some methed will notify someone of the results. (not sure which method is going to work for me and you?  stdout, logs-scrape, email, twitter, slack, etc.)


Functional Verification is defined as the process of verifying that an RTL (Synthesizable Verilog, VHDL, SystemVerilog) design meets its specification from a functional perspective. ... Functional verification establishes that the design under test (DUT) implements the functionality of the specification correctly.


verifying that the design meets its specification from a functional perspective. ... Functional verification establishes that the design under test (DUT) implements the functionality of the specification correctly.
 
**hooks directory**, there are two GitHub commit hooks that support running of **test cases**.  The pre-commit GitHub hook bash script creates a list of commited files with repository subdirectory.  The post-commit GitHub hook bash script runs found FVT test case(s) for a commited file.  The hooks directory was created because I wanted to modify the github hooks and track changes per repository.  [Learn more about how to setup test cases.](hooks/README.md)

## Setup Test Cases

    git clone https://github.com/BradleyA/user-files.git
    cd user-files/hooks
    ln -s ../../hooks/post-commit ../.git/hooks/post-commit
    ln -s ../../hooks/pre-commit ../.git/hooks/pre-commit
    cd ..
    mkdir TEST/<FILE_TO_BE_TESTED>/
    cd TEST/<FILE_TO_BE_TESTED>/

Create a test case in directory, TEST/<file_to_be_tested>/, and name the file 'FVT-<test-case-name-no-dot-001>' (example: FVT-option-help-001).  Place the expected results from the test case into a file with the same name but add '.expcted' ('dot'expected).  In your test case, pipe the output into a file with the same name but add '.test-case-output'.  Append the following lines into your test case:

    #
    diff "${0}".expected "${0}".test-case-output >/dev/null 2>&1
    RETURN_CODE=${?}
    if [ ${RETURN_CODE} -eq 0 ] ; then
           echo "${BOLD}Test case --->${NORMAL} ${0} ${1} ${RETURN_CODE} - No difference with expected output - ${BOLD}PASS - PASS${NORMAL}"
    elif [ ${RETURN_CODE} -eq 1 ] ; then
           echo "${BOLD}Test case --->${NORMAL} ${0} ${1} ${RETURN_CODE} - Differences with expected output - ${BOLD}FAIL - FAIL${NORMAL}"
           diff -y "${0}".expected "${0}".test-case-output
    else
           echo "${BOLD}Test case --->${NORMAL} ${0} ${1} ${RETURN_CODE} - Test script ERROR - ${BOLD}FAIL - FAIL${NORMAL}"
    fi


# Memo:
Add something about creating a symbolic link from ../.git/hooks to this hooks directory that are managed in this repository using markit.


Need to add somrthing here but what?
