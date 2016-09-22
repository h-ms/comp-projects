
# GitHub pages

[This tutorial](https://pages.github.com/) shows how to publish a webpage on GitHub pages.


## Work flow

GitHub lets you create websites for individual projects as well as a user or organization site.

### User or organization site

If the second option applies, proceed as follows:

1.  Create a repository called `username.github.io`
2.  Clone the repository to your local git environment. 
    When working in CodeAnywhere, every container by default is configured to be a git repository as well.
    Cloning `username.github.io` into the container's working dir would thus create a repository inside a repository.
    To prevent this, create a CodeAnywhere container that is a "connection" to the `username.github.io` repository:
    this will automatically set the value of the remote repository to GitHub's `username.github.io`.
3.  Create an `index.html` file in the `workspace` directory (the same directory that also contains the `.git` folder.
4.  Add the file to the staging area and commit.
5.  Push the commit to the remote repository simply by using `git push -u origin master`
6.  Check your website on `http://username.github.io`.

Improving and customizing GitHub webpages is covered in the next main section


### Project site

Create a GitHub site from scratch based on an existing project (repository).

1.  Create a new file and call it index.html
2.  Add some content
3.  

