
# Try Git

[This link](https://try.github.io/levels/1/challenges/1) contains an interactive tutorial on Git, a distributed version control system.


## Main work flow

Inside the directory you wish to version control type

    git init

To check the status of the repository type

    git status
    
Start tracking a file (adding to the staging area) by typing

    git add myfile.txt
    git add '*.txt'
    
Use quotes on wildcards: Git will expand wildcards to underlying folders, the shell will not!
    
To retract a file from the staging area, use

    git reset myfile.txt

Store changes to the repository using

    git commit -m "Add myfile.txt"
    
To get an overview of past commits, type

    git log

To see which changes have been made to the staging area since the last commit, use

    git diff --staged
    
Change a file back to how it looked like at the last commit (using `--` to explicitly indicate no further options are given after the dashes)

    git checkout -- myfile.txt
    
Remove files on disk as well as stage their removal from the next commit use

    git rm myfile.txt


## Remote repositories

Before pushing a local repository to the GitHub server, first define the remote repository: supply a name for the remote repository (usually `origin`) and give its URL

    git remote add origin https://github.com/try-git/try_git.git
    
Add your work (stored in commits) to the remote repository using

    git push -u origin master
    
`master` refers to the default branch name of the repository; `-u` tells `git` to remember the parameters so that the next push can be performed using just

    git push
    
Check for changes to the GitHub repository and pull down any new changes using

    git pull origin master
    
Compare any changes made with the latest version committed locally

    git diff HEAD


## Branches

When starting work on a feature typically the programmer copies the code to a new branch on the repository; when finished, this branch is merged back with the master branch
Create a new branch:

    git branch feature_x
    
Switch to the new branch using

    git checkout feature_x
    
After work on the feature is done, first switch back to the master branch

    git checkout master
    
And then merge into it the changes made on the feature branch

    git merge feature_x
    
Delete a branch you do not need anymore using

    git branch -d feature_x
    
    




