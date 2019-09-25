## Create custom test cases for a file

To use a different SA- test case other than the default test cases, remove the symbilic link (rm TEST/sample.sh/SA-setup.sh) and copy SA-setup.sh into the directory (cp -p hooks/EXAMPLES/SA-setup.sh TEST/sample.sh/). Edit SA-setup.sh with custom test cases needed for a Git commit file. Place the custom test cases in the same directory as the edited SA-setup.sh. Once finished use git add and git commit to have the test case changes tracked (TEST/sample.sh/SA-setup.sh).
    
    rm TEST/sample.sh/SA-setup.sh
    cp -p hooks/EXAMPLES/SA-setup.sh TEST/sample.sh/
    vi TEST/sample.sh/SA-setup.sh
    
    . . . something here soon .. . . cp sample.sh test.sh
    git add test.sh
    git-TEST-cases.sh --filename test.sh --add
    git-TEST-cases.sh -a
    

<img id="Steps git-TEST-commit-automation-5-1.gif" src="../images/git-TEST-commit-automation-5-1.gif" >



**That is it!**

#### [Back to README](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#create-custom-test-cases-for-a-file)
