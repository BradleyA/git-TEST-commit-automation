## Steps to uninstall git-TEST-commit-automation solution

**Start a new Git repository to test git-TEST-commit-automation solution**

    mkdir -p git-TEST-commit    #  Create a directory for a Git repository
    cd git-TEST-commit
    git init .                  #  Create an empty Git repository
    vi sample.sh                #  Write a shell script
    
         #!/bin/bash
         ###  sample.sh 
         echo "Hello World"
    
    chmod 775 sample.sh
    git add sample.sh
    git commit -m 'initial commit' sample.sh

<img id="Steps git-TEST-commit-automation-1.gif" src="../images/git-TEST-commit-automation-1.gif" >
    
**Download and execute setup-git-TEST-cases.sh to setup git-TEST-commit-automation solution**


say something other than rm -rf 
