
# Installing R on an HTML5 box (including Apache) in Codeanywhere.com

See [Terminal.com blog entry on Ubuntu Stats](http://blog.terminal.com/getting-an-up-to-date-r-and-rstudio-installation-on-ubuntu/).

## Install binary dependencies

Run the following commands with `sudo`.

~~~
apt-get update
apt-get install -y libcurl4-openssl-dev  
apt-get install -y libgstreamer-plugins-base0.10-0  
apt-get install -y gdebi-core  
apt-get install -y libapparmor1  
apt-get install -y  libxml2-dev  
apt-get install -y libcurl4-gnutls-dev

~~~

## Install R

Install `R` using an Ubuntu repository hosted on one of the CRAN mirrors.

~~~
sudo sh -c "echo 'deb http://cran.cnr.Berkeley.edu/bin/linux/ubuntu trusty/' >> /etc/apt/sources.list"
~~~

### Obtain a public key for the Ubuntu repository containing recent R versions

See [Berkeley CRAN mirror](https://cran.cnr.berkeley.edu/bin/linux/ubuntu/).
The Ubuntu archives on CRAN are signed with the key of “Michael Rutter marutter@gmail.com” with key ID E084DAB9. To add the key to your system with one command use:

~~~
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
~~~

Now update and get `R`:

~~~
sudo apt-get update  
sudo apt-get install -y --force-yes r-base r-base-dev
~~~

## Install R packages

Set a default CRAN mirror in the `.Rprofile.site` site-wide startup profile file.

```bash
sudo sh -c "cat >> /etc/R/Rprofile.site << EOF  
local({  
  # add MASS to the default packages, set a CRAN mirror
  old <- getOption('defaultPackages'); r <- getOption('repos')
  r['CRAN'] <- 'https://cran.rstudio.com'
  options(defaultPackages = c(old, 'MASS'), repos = r)
})
EOF"  
```

Run the following commands in `R` as superuser.

```r
install.packages("devtools")  
install.packages("roxygen2")  
install.packages("testthat")  
install.packages("knitr")

install.packages("dplyr")  
install.packages("tidyr")  
install.packages("plyr")  
install.packages("stringr")  
install.packages("ggplot2")

install.packages("knitr")
install.packages("rmarkdown")

install.packages("deSolve")
install.packages("shiny")

install.packages("pryr")
```

Building package `RcppEigen` does not work due to too low memory.

~~~
sudo apt-get install r-cran-rcppeigen
~~~

Then install `lme4` as superuser.



# Installing Emacs for text terminal

~~~
sudo apt-get emacs24-nox
mkdir ~/.emacs.d
touch ~/.emacs.d/init.el
~~~

## Installing Emacs package 'ess'

Use the Emacs package manager to install 'ess'. It ends up in ~/.emacs.d/elpa/ess-20151210.52


# Installing a graphical UI for R

Again, see [Terminal.com blog entry on Ubuntu Stats](http://blog.terminal.com/getting-an-up-to-date-r-and-rstudio-installation-on-ubuntu/).
We will install the RStudio-server version, which runs in the browser and is great for working in the cloud

~~~
sudo wget https://download2.rstudio.org/rstudio-server-0.99.893-amd64.deb
sudo gdebi -n rstudio-server-0.99.893-amd64.deb
~~~

RStudio server is installed and can be accessed on port 8787. `rstudio-server stop` kills the RStudio server process.

## Adding a password for a non-root user account for use with RStudio server

The following creates a password for user `cabox` with password `rstudio`.

~~~
    sudo sh -c "passwd cabox <<EOF  
    rstudio
    rstudio
    EOF"
~~~

# Install a recent pandoc version (including pandoc-citeproc)

~~~
sudo wget https://github.com/jgm/pandoc/releases/download/1.15.2/pandoc-1.15.2-1-amd64.deb
sudo gdebi -n pandoc-1.15.2-1-amd64.deb
~~~



# Updating and upgrading


## updating R packages (2016-01-08)

In `R` as super user, use

```r
old.packages() # check the output for packages you want to update
myOldPkgs <- old.packages()[c("ggplot2", "rmarkdown", "knitr", "MASS"),]
update.packages(oldPkgs = myOldPkgs, dependencies = TRUE)
old.packages() # check that updated packages are no longer shown in the output
```





