# Customizing the Jekyll blog

Complete the cycle, returning to the development environment to personalize the website/blog.


## Support for posts using R code

Read sections 13.4 and 15.2 in "Dynamic Documents with R and Knitr", second Edition.
Study the `servr` and [`knitr-jekyll`](https://github.com/yihui/knitr-jekyll) documentations

Optimal reproducibility is achieved when the results presented on the webpage are 
not obtained on your local workstation but on the continuous integration server.
See section "Continuous integration". This is however currently out of scope.


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
3.  Clean the jekyll build directories (`jekyll clean`)


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
        `<div class="row uniform">` element. These 4 `div` elements are layed out in CSS grid format with class names `6u` and `12u`:
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

The main blog page (`blog/index.html`) contains the blog posts in reverse chronological order.

Dependencies:

*   The main blog page calls layout file `_layouts/sidebar.html`, which loads
*   the default layout `_layouts/default.html` (which in turn calls header and footer include files). 
    The sidebar layout then loads
*   the sidebar include file `_includes/layout/sidebar.html`


#### Sidebar layout

This layout consists of a section element with class `"wrapper sidebar {{ page.sidebar_align | default: 'left' }}"`.
The section is wrapped around a `<div class="inner">` element that contains `{{ content }}` (the main blog page) 
wrapped in another `<div>`.
It is followed by the sidebar include file.


#### Main blog page

The main blog page's YAML header by default defines the following settings:

+   `layout: sidebar` (alternative: `layout: no-sidebar`) and
+   `sidebar_align: right`.

The page consists of a list of posts and a pagination utility, together wrapped in a `<section>` tag.

The list of posts is generated by a loop (`{% for post in paginator.posts %}`). Each element that is looped over consists of
an `<article>` element containing:

1.  a `<header>` tag, containing post title and date,
2.  a post excerpt,
3.  a button linking to the full post (list element of class `button` in unordered list of class `actions`),
4.  a horizontal rule (except for the last post displayed on the current page: `{% unless forloop.last %}`)

The pagination is implemented as follows:

1.  ony activate pagination if there is more than 1 page of posts
2.  if relative to the current page there exists a previous page, create a `Prev` button; otherwise, 
    create a disabled `prev` button (class="button disabled")
3.  create a loop over the pages to set a class and URL for each page. For each iteration set the class to `page active` if
    `page == paginator.page`.
4.  if relative to the current page there exists a next page, create a `Next` button; otherwise, 
    create a disabled `Next` button.

    
#### Sidebar include

The sidebar is a `<div class="sidebar">` element containing an arbitrary number of sections (2 in the template).
An image in a hyperlink is included; note the class and image URL:
`<a href="#" class="image fit"><img src="{{ site.baseurl }}/images/pic01.jpg" alt="" /></a>`



### Individual posts

Individual posts are in folder `_posts`.
Posts have in their YAML:

+   layout: `layout: post`. The `post` layout loads layout `no-sidebar`, which in turn loads `default`
+   title
+   date
+   image


#### Post layout

The YAML in `post.html` defines layout as follows:`layout: no-sidebar`.

The post layout contains:

+   a header containing page title and date
+   a post image (taken from the post's YAML) wrapped in a `span` of class `image fit`
+   the content of the post, loaded using `{{ content }}`


#### No sidebar layout

Loads layout `default`.

Contains `{{ content }}` wrapped in a `div` (`class="inner"`) and a `section` (`class="wrapper"`) element.


### Configuration file

`_config.yml` defines:

*   the location of `.scss` Sass files to be:

```
sass:
  sass_dir: assets/sass
```

*   title, tagline and description for the site. Do not forget to adapt these when adding content to the template
*   the number of blog posts per page and the blog pagination path:

```
paginate: 4
paginate_path: "/blog/page:num/"
```
    This will read in `blog/index.html`, send it each pagination page in Liquid as `paginator` variable and write the output
    to `blog/page:num/`, where `:num` is the pagination page number, starting with 2. If a site has 12 posts and
    specifies `paginate: 5`, Jekyll will write `blog/index.html` with the first 5 posts, `blog/page2/index.html`
    with the next 5 posts and `blog/page3/index.html` with the last 2 posts into the destination directory.
    Setting a permalink in the front matter of your blog page will cause pagination to break. Just omit the permalink!



### Elements page

Uses layout: `layout: no-sidebar`

A single page that illustrates the different styles (CSS classes) available with the Slate theme.


#### Sass files

Sass partials (starting with `_` and with extension `scss`) are located in `assets/sass/` and are grouped in folders: 

*   `base`
*   `components`
*   `layout`
*   `libs`

The remaining `.scss` files are in folder `assets/css/`.

##### `main.scss`

*   `main.scss` starts by importing all `.scss` partials in the `assets/sass/libs/` folder:
    +   `_vars.scss`: contains colors, fonts and other variables
    +   `_functions.scss`: concerned with extracting values of variables
    +   `_mixins.scss`: less relevant mixins for inserting fontawesome elements, padding and dealing with SVG images in IE
    +   `_skel.scss`: A Sass-based implementation of [Skel](http://skel.io), v3.0.1.
        `Skel` is described as "a lightweight framework for building responsive sites".
        It includes:
        1.  Simplified management of breakpoint media queries
        2.  A layout module including a fully responsive CSS grid system, built-in browser resets, utility classes (like container)
        3.  Useful mixins (like vendor)
*   All of the files in `assets/sass/libs/` contain variables, functions and mixins only, i.e. they generate no CSS output.
*   `main.scss` also imports (at the top) a minified fontawesome stylesheet (version 4.6.3) and googlefonts (direct from a URL)
*   `main.scss` then includes the `skel-layout` mixin which initializes the layout module
*   `main.scss` then creates a mixin `color` by including `color-` mixins from 10 partials in `assets/sass/base/` and `assets/sass/components/`
*   Note that these (and other) partials are imported in the final lines of `main.scss` because they output CSS (in contrast to the partials in `assets/sass/libs/`)






##### Essentials of Sass syntax (from the book "Jump start Sass")

This section is provided as background to help understand the `scss` architecture.

**Chapter 2: Sass**

*   Sass is a pre-processor that compiles `.scss` (or`.sass`) files to `.css`
*   Rule of thumb: "If it is valid CSS, it is valid SCSS"
*   Sass implementations are available as a rubygem (Ruby Sass) and C++ library (LibSass)


**Chapter 3: variables**

*   A variable in Sass always starts with a `$`
*   Data types include
    1.  string
    2.  number (optionally with unit: `42px`)
    3.  color (`hotpink`, `rgb(1, 33, 7)`, `#BADA55`)
    4.  list (`a, b, c`). The parentheses are optional: Any two or more values separated by a space or a comma form a list. A list may have a trailing comma.
    5.  map (`a: 1, b: 2`). Note that in Sass the **keys** of the key-value pairs can be of any data type. A map may have a trailing comma.
    6.  bool (`true`, `false`, optionally in combination with `not`)
    7.  null (which, just like `false`, is a falsy value)
    Determine type using function `type-of()`
*   Assign variables as follows: `$font-type: sans-serif;`
*   Strings can be concatenated with a `+` sign
*   `/` is interpreted as divisor if the calculation is in parentheses, is part of another calculation or involves a variable
*   Make a number unitless by dividing through 1 unit, e.g. `/ 1px`
*   A variable declaration will be omitted if its value is `null`
*   A variable can be defined locally or globally
*   `!default` in a variable declaration means the value will be used if the variable was not declared elsewhere
*   `!global` in a declaration means this declaration replaces the global variable
*   Variable substitution within strings, selectors, calculations and media queries is achieved by placing the variable in between `#{}` (similar to how this is done in Ruby)
*   Variables in media queries are substituted if placed in parentheses; however, the parentheses remain after substitition and therefore use of `#{}` may be required
*   CSS custom properties start with double hyphen and are called with `var()`
*   CSS custom properties do not use the scoping rules of Sass variables, but use cascading principles (from parent to children)
*   CSS custom properties exist in the browser and are accessible to e.g. Javascript


**Chapter 4: functions and mixins**

*   A function definition has the following structure: `@function function-name($a, $b: 2) { }`. Results are returned through a `@return` directive in the function block
*   Like variables, functions can have scope global or local
*   Required parameters (without default value) come before optional parameters (with default value)
*   Functions can be called anywhere variables can be called (with appropriate substitution): within selectors, media queries, properties, values, variables, functions, mixins
*   Arg-lists are parameters to which an ellipsis is added, meaning it takes as many arguments as needed
*   A mixin is a function that can output CSS code rather than return a result
*   Structure: `@mixin mixin-name() { }`. Parentheses omitted if there are no parameters
*   Call a mixin: `@include mixin-name;`
*   The default value of a parameter can be the value of another parameter defined before it
*   A mixin definition containing a `@content` directive allows passing dynamic blocks of style to the mixin (at call time)
*   Variables/parameters local to a mixin cannot be passed to a `@content` style block  


**Chapter 5: loops and conditions**

*   Conditions: 
```
@if () {
  } @else if () {
    } @else { }
```
*   Conditional operators: `and` and `or`
*   `if()` is a ternary function with parameters "condition", "return value for true", "return value for false"
*   `for` loops:
```
@for $i from 1 through 10 {
  // execution code
}
```
*   `each` loops iterate over collections (lists, nested lists, maps), optionally using multi-assignment (with nested list or list of maps)
```
@each $author, $filename in $authors {
  .section-#{$author} {
    background-image: url('/images/authors/#{$filename}');
  }
}
```
*   When using an each-loop to iterate over a map, the first variable in the loop definition contains the current key, and the second one contains the current value
*   `while` loop:
```
@while ($i > 0) {
  // do something with $i
}
```

**Chapter 6: nesting**

*   "Selector nesting" or "nested rules": the ability to write rule sets within other rule sets that result in composed selectors
*   When defining variables inside a rule set, all the nested rule sets will have access to them
*   "Parent selector reference" or "Ampersand selector": provides dynamical access the parent selector from an inner rule
    *   `&:hover`
    *   `  container &`
*   Also in deeply nested rules, the parent will be fully resolved when using `&`
*   A suffix added to the ampersand selector will result in a new selector (e.g. when using `&-hidden`)
*   "Context nesting": the ability to nest a scoping directive (e.g. `@media`, `@supports`) inside a rule set or scoping directive
```
.navigation li {
  display: block;
  
  @media screen and (min-width: 42em) {
      display: inline-block;
  }
}
```
*   `@at-root` directive: the ability to emit a style block at the root of the document, rather than nest it beneath its parent selectors
```
.button {
  color: red;
  
  @at-root a#{&} {  // results in a "a.button" rule
    color: blue;
  }
}
```
*   "Property nesting":
```
font: {
  family: 'Jump Start', sans-serif;
  size: 42px;
  weight: bold;
  style: normal;
};
```

**Chapter 7: the `@extend` directive**

*   the `@extend` directive is one way to handle inheritance in Sass. The goal is to represent a relationship between two items, where one is a category and the other is an object within that category
```
.message {
  background-color: gray;
  border: 1px solid black;
  margin: 1em;
}

.info {
  @extend .message;
  background-color: blue;
}
```
*   "Placeholder" or "Extend-only" selector: start with `%` and they disappear completely in the output (unlike the extended class in the example above)
*   Advanced extending: Mixins have to be defined before they’re used, but extends do not
*   "Nesting extends": when one nested selector extends another
*   As a rule of thumb, only extend placeholder selectors and only define placeholders in one location.
*   `@extend` fails to work at all across media queries
*   mixins are often easier to understand than `@extend`, with little or no downside in most cases


**Chapter 8: warnings and errors**

*   `@warn` and `@error` directives can be used in combination with a string or other data types: `@error` stops compilation.


**Chapter 9: architecture**

*   "Partial imports": files starting with underscore and with extension `scss` are imported (copy-pasted) by the `@import` directive without being individually compiled
*   it’s recommended to use as many partials as necessary, compiling them into a single stylesheet for production. Break out partials liberally, sorting them into folders, 
    and importing them all back into one single master file for compilation
*   Code that we want applied generally across the site should come first: global defaults first, followed by site-wide patterns and broad layouts, 
    and finally, more specific modules, themes, and overrides
*   Create a separate set of partials that produce no output; e.g. variables, functions, and mixin definitions, to be imported anywhere it might be useful    


#### Javascript files

Important ones are `skel.js` (which is provided as minified file) and `main.js`and `util.js`.




## Creating a prototype for the website (read section in "Creating blogs with Jekyll" on prototyping again)

Use a new branch to implement the modified site. Test locally and when satisfied, merge with master branch.
A similar strategy has been defined in [this](https://www.ahrenstein.com/blog/how-i-host-ahrenstein-com/) post: 
"You work on your Jekyll site via a development branch in GitHub. When you are ready to publish changes, merge it into the master branch."



### RSS feed

`feed.xml` is generated from available Liquid variables.
The [jekyll.tips](http://jekyll.tips/jekyll-casts/rss-feed/) site explains that the RSS feed should be added as a `<link>` tag in the `<head>` element (which is in `_layouts/default.html`).


### Code highlighting



### Tags and categories



### Blog search function



### Blog archive page or sidebar



### Implementing RSS/Atom feeds



### Implementing linkback 



### Add `_site/` to `.gitignore`












