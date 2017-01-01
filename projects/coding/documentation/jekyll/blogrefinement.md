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

The main page (`index.html`) loads 

1.  the default layout (from `_layouts/`), which in turn loads header and footer (from `_includes/layout/`)
2.  components (feature and post pages, from `_includes/components/`)
3.  a banner (from `_includes/layout/`)


#### Default layout

File `default.html` in `_layouts/` consists of:

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
        ["you can pass parameters to an `include`"](https://jekyllrb.com/docs/templates/). Parameter `class` takes its value, `page.header_class`,
        from the `index.html` page YAML. It is called in `header.html` as follows: `class="{{ include.class }}"`.
    +   After `content` and `footer`, a number of Javascript scripts, located in `assets/js/`, are added to `<body>`:
        *   `jquery.min.js`, minified version of jQuery v1.11.3
        *   `jquery.dropotron.min.js`, "a customizable jQuery plugin which enables you to append an animated, ul list based, multilevel drop down menu to any element"
        *   `jquery.scrollex.min.js`, "jQuery plugin that detects scroll events (e.g. enter, exit, scroll through) and triggers a function based on the scroll position"
        *   `skel.min.js`, "a lightweight framework for building responsive sites and web apps"
        *   `util.js`, utility functions that are also part of the Javascript assets in "HTML5 UP" themes by `@ajlkn`
        *   `main.js`, theme-related functions


##### Header and footer        
        
File `header.html` in `_includes/layout/`:

*   This file defines the site header and navigation. Set `header_class` to `alt` in the `index.html` page frontmatter (YAML)
    to blend the header with the page. The `header_class` parameter is passed on from `index.html` through `default.html` to
    `header.html`, where it is called as `"{{ include.class }}"`.
    This file consists of:
    *   A `<header>` tag, consisting of
        *   an `<h1>` heading: a hyperlink to `index.html` with link text consisting of site title (in template: "Slate") next to
            a site tag in a `<span>` element (in template: "by Pixelarity") 
        *   an extensive navigation bar consisting of 5 list elements, with hyperlinks in each element. Template values are:
            *   "Home", 
            *   "Page Layouts", in turn consisting of 4 elements:
                *   "Left Sidebar", 
                *   "Right Sidebar", 
                *   "No Sidebar",
                *   "Submenu", consisting of 4 elements:
                    *   "Option one"
                    *   "Option two"
                    *   "Option three"
                    *   "Option four"
            *   "Blog",
            *   "Elements" and
            *   "Sign up"      


File `footer.html` in `_includes/layout/`:

*   This file defines a `contact` section with `class="wrapper split"`, wrapped around a `<div class="inner">` element,
    consisting of subsections:
    *   "Send us a message" which is a `<form method="post">` element containing 4 `<div>` elements wrapped in a
        `<div class="row uniform">` element
        *   a name field in an `<input type="text">` tag 
        *   an email field in an `<input type="email">` tag
        *   a message field in an `<textarea name="message">` tag 
        *   two buttons  (`<input type="submit">` and `<input type="reset">`) in an unordered list
    *   "other ways to contact us" is an unordered list of 6 elements, each consisting of 
        *   a "font-awesome" icon wrapped in `<span>` tags,
        *   a heading,
        *   a hyperlink inside a paragraph
        The 6 list elements are email, phone, Twitter, Facebook, mail address, Linkedin.

The next element is the actual `<footer>`, again wrapped around a `<div class="inner">` tag. The footer consists of:

*   A copyright statement in a paragraph element
*   An unordered of 3 elements, each containing a hyperlink. If the anchor text consists of more than one word,
    all words after the first are wrapped in a `<span>` tag. This might make these links more responsive.
    

#### Banner and components

The content on the `index.html` page consists of

1.  a slideshow banner
2.  a spotlight item
3.  features
4.  posts


##### Banner

The main page (`index.html`) calls a banner with code located in `_includes/layout/banner.html`.
Three banner images (with text and links) are defined in the YAML variable `banner` in `index.html` and
are then added to a Liquid parameter as follows `{% include layout/banner.html slides=page.banner %}`.
This parameter is referred to in `banner.html` as `include.slides`.

The `banner.html` code consists of a single `<section>` tag.
Inside the section, a loop (`{% for slide in include.slides %}`) iterates over the banner images,
putting each of them inside an `<article>` environment, together with a hyperlink (inside a `<div class="inner">`
tag) pointing to `{{ slide.url }}` with anchor text `{{ slide.title }}`.


##### Components: features

After a section for the spotlight item, `index.html` starts a section that loads `features.html`:
`{% include components/features.html features=page.features %}`.
YAML metadata for each feature are listed in `index.html`. Each feature has an associated "font awesome" icon,
title and excerpt.

The `features.html` code consists of a `div` element of class `features` wrapped around a loop over the featured items.
These items are accessed through `{{ include.features }}`.
Each item consists of a section tag wrapped around an icon (in a `<span>` wrapper), a heading and an excerpt.


##### Components: posts

The last section loads an array of posts, with meta-data for each post given in the YAML of `index.html`:
`{% include components/posts.html posts=page.posts %}`.

Posts are dealt with similar to features. If a URL is available for a post, a "More" button is added to the post excerpt. 



### Blog page

The blog page (`blog/index.html`) contains the blog posts in reverse chronological order.

Dependencies:

*   The blog page calls layout file `_layouts/sidebar.html`, which loads
*   the default layout `_layouts/default.html` (which in turn calls header and footer include files). 
    The sidebar layout then loads
*   the sidebar include file `_includes/layout/sidebar.html`


#### Sidebar layout



#### Blog page

The main blog page's YAML header by default defines the following settings:

+   `layout: sidebar` and
+   `sidebar_align: right`.

The page consists of a list of posts and a paginator, together wrapped in a `<section>` tag.


#### Sidebar include




#### Main page

*   `index.html`: uses layout `default`



## Creating a prototype for the website (read section in "Creating blogs with Jekyll" on prototyping again)



### Code highlighting



### Blog search function



### Blog archive page or sidebar



### Implementing RSS/Atom feeds



### Implementing linkback 















