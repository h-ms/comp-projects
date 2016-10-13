
# GitLab

Summary info on configuration and workflows of GitLab EE (enterprise edition).


## Version

Version accessed on 2016-10-07 was 8.8.2-ee 73137a1.


## SSH key

A key was generated and stored in `/home/maashu/.ssh/` using command `ssh-keygen -t rsa -C "hugo.maas@boehringer-ingelheim.com"` and a passphrase.
The key was installed and the SSH protocol can now be used to push and pull to and from GitLab.


## Git

On server inhas1606, **git** version was 1.7.1 on 2016-10-07.


### Git global user settings

+--------------+------------------------------------------------+
| user.name    |  maashu (also make this the GitLab user name)  |
+--------------+------------------------------------------------+
| user.email   |  hugo.maas@boehringer-ingelheim.com            |
+--------------+------------------------------------------------+
| core.editor  |  nano                                          |
+--------------+------------------------------------------------+


### Remote repository

After setting up a (group and a) project on the GitLab page, clone the (empty) repository to a project folder.
Use the SSH protocol with the passphrase.

    git clone git@gitlab.eu.boehringer.com:PMx_LitReview/weight_loss_models.git

Change directory to the cloned Git repository.
The `remote origin` repository is now set to the one on the GitLab server.


### RStudio

Create an R Studio project structure inside the Git Repository


## GitLab pages

"With GitLab Pages you can host your static websites on GitLab. 
GitLab Pages are disabled. Ask your system's administrator to enable it."

Unavailability of GitLab pages means that standard rmarkdown functionality needs to be used to present projects.










