# Customizing the Jekyll blog

Complete the cycle, returning to the development environment to personalize the website/blog.


## Support for posts using R code

Read sections 13.4 and 15.2 in "Dynamic Documents with R and Knitr", second Edition.
Study the `servr` and [`knitr-jekyll`](https://github.com/yihui/knitr-jekyll) documentations

Optimal reproducibility is achieved when the results presented on the webpage are 
not obtained on your local workstation but on the continuous integration server.



### R development environment setup

Set up an R environment and install packages `knitr` (1.15.1) and `servr` (0.5).

~~~
sudo sh -c "echo 'deb http://cran.cnr.Berkeley.edu/bin/linux/ubuntu trusty/' >> /etc/apt/sources.list"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo apt-get update
sudo apt-get install -y --force-yes r-base r-base-dev
sudo Rscript -e 'install.packages(c("knitr", "servr"), repos  = "https://cran.rstudio.com")'
~~~

Set up R studio

~~~
sudo apt-get install gdebi-core
sudo wget https://download2.rstudio.org/rstudio-server-0.99.893-amd64.deb
sudo gdebi -n rstudio-server-0.99.893-amd64.deb
~~~

RStudio server is installed and can be accessed on port 8787. `rstudio-server stop` kills the RStudio server process.
Set password for user `cabox` using `sudo passwd cabox`.


### Changes to Jekyll blog code

1.  Upload an example Rmarkdown post from <https://github.com/yihui/knitr-jekyll> and upload it to new Jekyll folder `_source`
2.  From an R session in the blog root folder, enter command `servr::jekyll(command='bundle exec jekyll serve --host=0.0.0.0')`.
    From now on, whenever the `.Rmd` files are edited and saved, `servr` automatically recompiles them and refreshes the HTML output.
3.  Clean the jekyll buidl directories (`jekyll clean`)


### Continuous integration

Jekyll cleaning actions could be extended to include cleaning of the compiled `Rmd` files. This would mean that `Rmd` compilation
would take place as part of Gitlab's Continuous Integration workflow. This in turn requires Docker containers with both R and Ruby installed on them.
See [this](http://www.jonzelner.net/docker/reproducibility/2016/06/03/docker/) post by Jon Zelner.
This procedure improves reproducibility. On the other hand, it increases build time. Currently, this is out of scope.



## Understanding the `slate` theme


### Main page

The main page loads 

1.  the default layout (from `_layouts/`), which in turn loads header and footer (from `_includes/layout/`)
2.  components (feature and post pages, from `_includes/components/`)
3.  a banner (from `_includes/layout/`)


#### Default layout

1.  `default.html`
    *   `<head>`
        +   `<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />` is part
            of this site's responsive design
        +   `<title>{% if page.title %}{{ page.title | escape }}{% else %}{{ site.title | escape }}{% endif %}</title>` where `escape`
            is a standard Liquid filter, escaping a string without substituting the Liquid tag with an HTML tag
        +   the `page.excerpt` Liquid variable is trimmed down and used as HTML page description
        +   if scripts are not supported (`<noscript>`) by the browser, CSS file `noscript.css` is used. Otherwise, `main.css` is used.
            Both are located in `assets/css/`.
    *   `<body>`
        +   An `include` tag calls the `header.html` file located in `_includes/layout/`: `{% include layout/header.html class=page.header_class %}`.
            ["you can pass parameters to an `include`"](https://jekyllrb.com/docs/templates/). For example, `class` is defined in `default.html`
            (getting its value `alt` from the `index.html` YAML) and used inside `header.html` as follows: `class="{{ include.class }}"`.
        +   After `content` and `footer`, a number of Javascript scripts, located in `assets/js/`, are added to `<body>`:
            *   `jquery.min.js`, minified version of jQuery v1.11.3
            *   `jquery.dropotron.min.js`, "a customizable jQuery plugin which enables you to append an animated, ul list based, multilevel drop down menu to any element"
            *   `jquery.scrollex.min.js`, "jQuery plugin that detects scroll events (e.g. enter, exit, scroll through) and triggers a function based on the scroll position"
            *   `skel.min.js`, "a lightweight framework for building responsive sites and web apps"
            *   `util.js`, utility functions that are also part of the Javascript assets in "HTML5 UP" themes by `@ajlkn`
            *   `main.js`, theme-related functions


#### Header and footer        
        
1.  `header.html`
    *   This file defines the site header and navigation. Set `header_class` to `alt` in the (`index.html`) page frontmatter (YAML)
        to blend the header with the page.


*   `index.html`: uses layout `default`



#### Components and banner



#### Main page



## Creating a prototype for the website (read section in "Creating blogs with Jekyll" on prototyping again)



### Code highlighting



### Blog search function



### Blog archive page or sidebar



### Implementing RSS/Atom feeds



### Implementing linkback 















