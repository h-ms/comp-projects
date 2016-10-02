
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

1.  Create a new file and call it `index.html`
2.  Add some content
3.  Commit
4.  If working locally, push the commit to the remote repository
5.  In the project's `Settings` tab, go to GitHub pages and select `master branch` in the `Source` field
6.  View the result on `https://username.github.io/projectname/`


## Using Jekyll as a static site generator

Set up Jekyll locally to test changes to your site.
Installation requires a recent version of Ruby.
With Ruby available, install Jekyll as follows (tested in CodeAnywhere with Ubuntu 14.04 LTS):

Install Bundler:

    sudo gem install bundler

Create a Gemfile in the local git repository.
Add the following code to a text file called `Gemfile`.

    source 'https://rubygems.org'
    gem 'github-pages', group: :jekyll_plugins
    
Install Jekyll and other dependencies from the GitHub Pages gem:

    sudo bundle install
    

### Generate Jekyll site files

Create a Jackyll template site as follows:

    bundle exec jekyll new . --force

The output should say something like: `New jekyll site installed in /home/cabox/workspace.`

Edit your Gemfile and remove the following line: `"jekyll", "3.2.1"`.
Uncomment the following line by removing the `#`: `gem "github-pages", group :jekyll_plugins`

The above locks the Jekyll version to that used by GitHub pages.

Use `sudo bundle update github-pages` to update to the version run by HitHub pages.

Commit and push changes to the site to GitHub using Git.


### Build and test your local Jekyll site

Run 

    sudo bundle exec jekyll serve


### Intro to Jekyll (from the book: "Creating Blogs with Jekyll" by Vikram Dhillon)

The GitHub Pages Help sites do not explain in-depth how to blog with Jekyll.
Therefore, a summary of abovementioned book is given here (parts II and III).

1.  Jekyll contains a parser ("kramdown") that converts markdown into HTML; HTML is subsequently entered into a blog template (to be provided by the user).
    All in all, the following elements are input:
    *   Content consisting of GitHub-flavoured Markdown (GFM) blog post text    
    *   Template file (written in "Liquid") specifying the structure of the static web page
    *   Include file
    *   Configuration file containing options and variables required for compilation
    And a static HTML site is output.

2.  Both the blog post contents and the static website are version-controlled using Git.

3.  In a Jekyll blog site, both the CSS and HTML aspects can be powered by **stylistic front-end frameworks**. These are time-saving alternatives to using HTML5 and CSS3.
    *   For HTML, these are [Bootstrap](http://getbootstrap.com/) and [Foundation](http://foundation.zurb.com/).
    
        In essence, Bootstrap is extending HTML to do more complex tasks such as making a drop-down menu as in just a few lines of code.
        Bootstrap components are segments of HTML code with auto-styling applied.
        Bootstrap is available as a CDN link and as an archive that can be downloaded from the web site to be used as a template.
        
        Foundation is a framework with a slightly more advanced grid layout.      
        
    *   For CSS, these are [Sass](http://sass-lang.com/) and [LESS](http://lesscss.org/).
    
        Sass is a ruby-based CSS pre-processor (similar to PHP being a pre-processor for HTML) that makes lengthy CSS manageable. 
        It uses variables and inheritance in an object-oriented programming style.
        Sass comes in two types of syntax: SCSS and indented (the former being the standard).
        Sass works with multiple modular style sheets (with name format `_filename.sass` if they are imported) that are combined by the pre-processor before being presented to the web server.
    
    Neither of the frameworks Sass and LESS is specific to front-end packages such as Bootstrap or Foundation.
    
4.  Jekyll needs to access markdown blog posts and show them under the appropriate panel (set up in HTML using the stylistic framework).
    The code doing this is a **handlebars component** that can turn a normal theme into a Jekyll-injectable blog template.
    
5.  A repository of Jekyll themes is provided in <http://jekyllthemes.org/>.
    *   the Whitepaper theme, which is Bootstrap-based, is discussed, as well as
    *   Vanilla Bean Cr&#232;me is Sass- and Jekyll-based and
    *   Emerald, which is responsive and has an off-canvas menu.
    *   Compass is a simple theme suitable for creating quick landing pages.


### Fundamentals of Jekyll (from the book: "Creating Blogs with Jekyll" by Vikram Dhillon)

#### Folder structure

Folders with name syntax `_foldername` pertain to blog settings.

`_config.yml`

:   global variables contained in YAML front-matter (e.g. for site-wide colors)

`_drafts`

:   individual ideas for blog posts contained in GHF markdown files

`_includes`

:   re-usable blocks of code (such as HTML components); map files to posts using the Liquid tag `{% include file.html %}`

`_layouts`

:   layout files (really templates) consist of HTML infused with [Liquid](https://help.shopify.com/themes/liquid/basics) and handlebars.
    Layout `default` is the master layout and takes priority over others. Layout code that needs to be used globally should go in the `default`.
    E.g. `font-awesome`, Bootstrap's collection of vectorized icons which can be added to the header of the `default` HTML template.

`posts`

:   contains blog posts and content for filling in templates and layouts. Filenames have to be in the date-filename format, `year-month-date-complete_filename.md`.
    Not all files in `_posts` are posts; the front matter should specify what the file contains.
    
`_data`

:   any CSV or JSON formatted (meta)data to be made accessible through the blog using the Liquid templating system. Example: info on authors that write for the blog.

`_site`

:   populated by Jekyll using the compiled site, which can be served straight to a web server (e.g. Apache)

`index.html`

:   front page; in Jekyll, typically holds very little information



Meta-data and instructions about the blog (posts) is stored in variables such as `title` and `description` in YAML front-matter. Other variables:

*   `layout` specifies the layout file to use 
*   `permalink` specifies more meaningful permalinks for published blog-posts than the standard Jekyll link format
*   `category` specifies the blog post category
*   `tag`
*   `comments`

In another use of YAML, meta-data on authors can be stored in a `.yml` file in `_data`.
Information contained in YAML is typically implemented (using Liquid) in the `head` of layout files.
Front-matter YAML variable `author` in a specific blog post specifies for which author in `_data/authors.yml` meta-data should be loaded in the post's layout file.


#### Liquid

Liquid (and the handle bars javascript library) provide blog themes with programmatic access to site data.

##### Tags

Liquid has the following *tags*, all of which are wrapped inside `{%  %}`:

1.  Control-flow tags
    +   `if` tag   
        ```{% if product.title == 'shoes' %}
             These shoes are awesome!
           {% endif %}```
    +   `elsif` and `else` tags
    +   `case`/`when` tags (work like a switch, comparing a statement against alternatives and performs an action in case of a match)
        ```{% case food %}
             {% when 'cake' %}
               Mmm, cake!
             {% else %}
               Unknown
             {% endcase %}```
    +   `unless` tag
2.  Iteration tags
    +   `for` tag
        ```{% for author in site.authors %}
             {{ author.display_name }}
           {% endfor %}```
    +   `continue`
    +   `break`
3.  Variable tags
    +   `assign`
        ```{% assign new_variable = false %}```
4.  Theme tags
    +   `include`, allows including modular components (stored in the `_includes` folder) in themes and templates.


##### Objects

Output an object's attribute using: `{{ object.attribute }}`.

*   Objects relevant to Jekyll are 
    *   `site`, representing the entire blog, containing attributes
       * `.pages`, a list of all pages
       * `.posts`, list of posts in reverse chronological order
       * `.data`, data loaded from YAML files in the `_data` folder
       * `.categories.sample`, a list of all posts in category "sample"
       * `.tags.sample`, a list of all posts with tag "sample"
    *   `page`, representing a specific page, containing attributes
       * `.content`,
       * `.title`,
       * `.excerpt`,
       * `.url`, returns the post's URL without domain with leading slash
       * `.categories`, specified in YAML front matter, derived from directory structure *above* the `_posts` directory
    *   `paginator`, organizes the blog into pages, containing attributes
       * `.per_page`, the number of posts per page,
       * `.posts`, the posts on a given page,
       * `total_posts`,
       * `page`, page number

More info on <http://docs.shopify.com/themes/liquid/>.


##### Inheritance

Layouts can be inherited using YAML.

    ---
    layout: default
    ---
    <h1>Testing out a new page</h1>

Files can be inherited using `include`.

    {% include header.html %}
    <h1>Testing below the header</h1>
    
Here, `include` avoids having to rewrite all the code of the `header.html` file.


### Examples

The remainder of the book "Creating Blogs with Jekyll" is dedicated to example projects that show how the elements covered so far come together.

Jekyll's Blog-Awareness means that it has built-in support for blog-related features such as 

*   permalinks
*   categories
*   pages
*   custom layouts

When trying out the examples listed in the book, you may need to switch between themes. Instead of copy pasting and deleting specific files,
use the help in <http://stackoverflow.com/a/37186333>.





    

      
           
           
           

       











