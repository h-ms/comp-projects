# Setting up a blog skeleton with Jekyll, Pixelarity, CodeAnywhere and Gitlab

## Gitlab project

Create a new project with path: `https://gitlab.com/h-ms/` and project name `h-ms.gitlab.io`,
where `h-ms` is my Gitlab user name.
As we are using a [Pixelarity](https://pixelarity.com) blog theme for the Jekyl blog, we set the repository to "private". 
[Pixelarity](https://pixelarity.com) terms and conditions prohibit sharing of theme code.


## Website development environment

1.  In a new CodeAnywhere project (named `gitlab`), create a new "connection" named `h-ms.gitlab.io`.
    Set this connection up as a "Ruby Development Stack with Node.js, RVM, Ruby Version and Ruby on Rails preinstalled", 
    with 5 Gb disk storage running on Ubuntu 14.04 (64 bit)
2.  Install the CodeAnywhere default public SSH key (named `codeanywhere-ssh-key`) in Gitlab


### Background software (RVM, Ruby and Bundler)

The following commands are run from `/home/cabox/workspace` on a CodeAnywhere box.

1.  Run `sudo apt-get update` and `sudo apt-get upgrade` to update installed packages
2.  Installed software includes:
    *   `rvm 1.25.30 (master)`: 
         Install public key and upgrade to latest stable version:
         `gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3` followed by
         `rvm get stable`
         Latest stable version is `1.27.0`
         Upgrade to newest version:
         `rvm use ruby --install --default`
    *   Version installed: `ruby 2.3.0p0 (2015-12-25 revision 53290)`
        Uninstall older ruby 2.1.2: `rvm uninstall 2.1.2`
3.  Install Bundler using `gem install bundler`. Version installed: `1.13.6`.


### Jekyll blog engine and the `slate` theme

A subscription to [Pixelarity](https://pixelarity.com) is required to obtain Jekyll theme `slate`.
Alternatively, a free theme may be obtained, for example from <`http://jekyllthemes.org`> or
[Cloudcannon](http://cloudcannon.com/announcements/2016/12/05/free-jekyll-templates/).

1.  Download the Jekyll version of the `slate` theme from Pixelarity, upload the ZIP file to the CodeAnywhere box and
    extract the ZIP file (`unzip px-slate-jekyll.zip`).
    Copy the contents of folder `light` to the top-level blog directory (`cp -R light/. .`), 
    then delete the theme sources again
2.  Check the settings in the `_config.yml` file:
    *   set url: `"http://h-ms.gitlab.io"`
    *   create a `Gemfile` containing the following three lines: `source "https://rubygems.org"`,
        `gem "jekyll", "~> 3.3.1"` and `gem "jekyll-paginate", "~> 1.1.0"`
3.  Run `bundle install` followed by `bundle exec jekyll serve --host=0.0.0.0` and
    check that the site has been created on port 4000 of the box, in my case on <http://h-ms-gitlab-io-hugojmaas486530.codeanyapp.com:4000/>

    
## Website deployment on Gitlab

### Version control and page hosting (using continuous integration)
 
1.  Clean the build directories `_site` and `.sass-cache` (`jekyll clean`)
2.  Create a `.gitignore` file containing `Gemfile.lock`
3.  In the blog project root, add a file `.gitlab-ci.yml` and add the following instructions:
        image: ruby:2.3
        pages: 
          script: 
          - gem install bundler
          - bundle install
          - bundle exec jekyll build -d public/ 
          artifacts: 
            paths: 
            - public 
          only: 
          - master
4.  Configure the Gitlab repository to be the remote repository (`git remote add git@gitlab.com:h-ms/h-ms.gitlab.io.git`)
5.  Add, commit and push the repository
6.  Check that the website is online at <https://h-ms.gitlab.io/>.

<!-- To do: check that the website is actually secure -->


#### Adding a custom domain

<!-- To do -->


#### Adding CDN

<!-- To do -->
















