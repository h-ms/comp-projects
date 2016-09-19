
# GitHub

[This link](https://www.youtube.com/watch?v=0fKg7e37bQE) contains an instruction video on developing and collaborating in GitHub pages.


## Cloning

If a repository structure has been set up in GitHub but none exists yet locally, clone the GitHub repository into a local folder of your choice

    git clone https://github.com/h-ms/newrepo.git
    
and then start working from this cloned repository.


## Fetch and push

If a local repository already exists, push its contents to a (newly created) GitHub project as follows:

1.  stage and commit the contents of the local repository
2.  add the remote repository (`git remote add origin https://github.com/...`)
3.  fetch the remote repository (`git fetch`)
4.  push the local repository to the remote (`git push -u origin master`)