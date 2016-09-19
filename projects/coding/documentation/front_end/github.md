
# GitHub

[This link](https://www.youtube.com/watch?v=0fKg7e37bQE) contains an instruction video on developing and collaborating in GitHub pages.
The summary below only explains how to get started in two situations. The remainder has been summarized in the "Try Git" documentation.


## Cloning

If a repository structure has been set up in GitHub but none exists yet locally, clone the GitHub repository into a local folder of your choice

    git clone https://github.com/h-ms/newrepo.git
    
and then start working from this cloned repository.


## Fetch and push

If a local repository already exists, push its contents to a (newly created) GitHub repository as follows:

1.  add the remote repository (`git remote add origin https://github.com/...`)
2.  pull the remote repository (`git pull origin master`) in order to update the local code base with any files present on the remote 
3.  stage and commit
4.  push the local repository to the remote (`git push -u origin master`)

