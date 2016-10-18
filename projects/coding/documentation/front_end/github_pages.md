
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
    To prevent this, create a CodeAnywhere container that has a "connection" to the `username.github.io` repository:
    this will automatically set the value of the remote repository to GitHub's `username.github.io`.
3.  Create an `index.html` file in the `workspace` directory (the same directory that also contains the `.git` folder.
4.  Add the file to the staging area and commit.
5.  Push the commit to the remote repository simply by using `git push -u origin master`
6.  Check your website on `http://username.github.io`.

Improving and customizing GitHub webpages is covered in the next main section


### Project site

Create a GitHub site from scratch based on an existing project (repository). When starting from scratch, the workflow is as follows:

1.  Create a new file and call it `index.html`
2.  Add some content
3.  Commit
4.  If working locally, push the commit to the remote repository
5.  In the project's `Settings` tab, go to GitHub pages and select `master branch` in the `Source` field
6.  View the result on `https://username.github.io/projectname/`

When creating pages for an existing project, branch `gh-pages` is used by the automatic page generator (see "GitHub Pages" in the "Settings" menu)


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

    sudo bundle exec jekyll serve --host=0.0.0.0


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

When trying out the examples listed in the book, you may need to switch between themes. Instead of copy pasting and deleting specific files, use the help in <http://stackoverflow.com/a/37186333>.
In short, the process involves 

1. creating a new branch without history (`git checkout --orphan newtheme`), 
2. switching to it (`git checkout newtheme`, make sure this switch is executed!), 
3. cleaning it out (`git rm -rf .`, `git clean -dfx`),
4. adding the theme repo as an "upstream" remote (`git remote add upstream <url>` i.e., unlike the "origin" remote, you only pull from it, never push to it)
5. `git fetch upstream` (updates the remote-tracking branch),
6. `git pull upstream master`
7. Build the theme locally and test it (`sudo bundle exec jekyll serve`); check out the `Gem` files from the master branch if they are missing in the new branch.
7. Copy across blog posts from the master branch: `git checkout master -- _posts` (and perhaps `_drafts` as well). Also rename or remove files leading to conflict (e.g. `Gemfile`)
8. stage and commit changes
9. define the merge strategy for merging the new theme branch with the main branch (`git merge -s ours master`), favoring the new theme's code in case of conflicts
10. switch to master branch,
11. merge the new theme branch `git merge newtheme`
12. add, commit, push the changes
13. delete the new theme branch


#### Kactus theme (/nickbalestra/kactus)

*   an `assets` folder contains styling assets for the blog
    *   CSS style sheets
    *   fonts
    *   images used in blog posts or pages
    *   JS files pertinent to theme or layout
*   a `feed.xml` file contains ATOM feed of blog posts and other changes synchronized over the web
*   the `_includes` folder contains 
    *   a `disqus.html` file, containing JS code provided by commenting system "Disqus". Further instructions
        can be found on the [Disqus site](https://help.disqus.com/customer/portal/articles/472138-jekyll-installation-instructions).
    *   a `footer.html` file, containing code for the page's footer (containing Liquid variables)
    *   a `navigation.html` file, containing the code for a navigation bar
    *   a `pagination.html` file; spreads posts across pages (starting with page 0) and adds "Previous" and "Next" page links.
    *   a `post_list.html` file that shows (on the home page) the list of posts: the code in this HTML file is usually present in `index.html`           
    *   the `profile.html` file contains the author's profile, included in every page using the layouts
    *   the `share.html` file provides code that allows users to share posts on Twitter or Facebook. Share buttons can be implemented in 3 ways:
      *  using embed code provided by the social media site
      *  using embed code obtained through a third-party plugin service (with blog pages linked through an Admin panel)
      *  completely custom code (used e.g. in the kactus theme): providing a link to the social media site where post can be shared
*   the `_layouts` folder containing templates (layouts) that tell Jekyll what to take from the `_includes` folder and how to integrate it into a web site
    *   the `default.html` layout (from which all other layouts inherit)
      *  the `head` includes page title and favicon, stylesheets (including for syntax highlighting) and RSS feed
      *  the `body` loads include files such as profile, navigation, as well as 
      *  javascript code including JQuery, `main.js`, `highlight.js`, a function `initHighlightingOnLoad()` and Google Analytics.
    *  the `posts.html` layout is the template that every post (i.e. file with YAML layout variable set to "post") will follow and that builds on the default layout
      *  contains an `article` tag with class `"post"`, with inside it a `section` tag with id `"post-body"`,
      *  contains a `footer` including author's Twitter home, name and site info and loads the code in `share.html`
      *  contains a `div` for Disqus comments (if applicable)
      *  contains the archive post list (as an unstructured list)
*   the `_posts` folder containing markdown posts
*   `index.html` specifies that the author profile is displayed (YAML: `profile: true`) and imports `post-list.html` and `footer.html`
*   `_config.yml` allows all parameters (site, page or YAML) for the blog to be defined
    
    
#### Jekyll themes and Git

The theme used in this Chapter will be converted by GitHub Pages to a static website, hosted by GitHub Pages.

##### Planning and designing a web site

A web site project specification covers the following aspects:

1.  Scope
    *   objective
    *   audience
    *   interactivity
    *   time spent on content versus maintenance
2.  Scale
    *   how easy will it be to integrate new technology
    *   mailing list (expanding audience)
3.  Tools list
    


Design pointers:

* If examples of similar web sites are available, use those for inspiration.
* Create a prototype post, archive, ... page (e.g. on plain paper) to start analyzing the behavior of your site.
* Prototypes can be used to answer the design questions around scope and scale.
* Then, make a tools list and think about code snippets/include files that are needed to implement them.


##### Adapting the Kactus theme to a news blog

In the following, make sure to compile changed code to apply changes.
The "trick" performed here is to display content on the static `index.html` page (using template `default.html` and by-passing dedicated "post" pages).

1.  Enable adding icons from [fontawesome](http://fontawesome.io/get-started/) CDN:
    Place the fontawesome CSS file link (or: the JS file link) into the layout's `head`. The file that defines the `head` may be in `_includes` or `_layouts`. For theme Kactus, it is in layout file `default.html` (from which all other layout files inherit).
2.  Add icons to various include files such as `navigation.html` (note however that the use of icons is not necessarily considered good user experience practice)    
3.  Make changes to the number of posts per page (1) and remove the "profile" page from the blog    
4.  In the `post-list.html` remove the hyperlinks, as posts should appear on the same page as the post list
5.  Also, display post content on the post list
6.  Add share buttons; the code snippet that holds the share buttons goes into the `pagination.html` code which makes for easier spacing. More efficient handling of social media can be achieved using third party service AddThis.
7.  Add an archive: add the link to the archive in the navigation section of `pagination.html`.
8.  Write the archive code: this involves looping through the list of posts and separating them according to publication year
9.  Enable commenting and add the Disqus short name to `_config.yml`. Add the commenting as a property of the "post list" page (as in the new theme blog post appear in "post-list" pages rather than "post" pages). The post-list calls the pagination code: add the `{% include disqus.html %}` code at the end of the navigation bar at the end of the pagination page.
10. Setup a mailing list (using Mailchimp: "Create a List" menu option and then create a General signup form). The next step is adding subscribe functionality at the top of the page.
11. Add page and post titles under the top navigation links/arrows in the `navigation.html` code.
12. Modify the style file in `assets/css/style.css`. Because this folder is not interpreted by Jekyll (it does not start with `_`) CSS code modifications can be tested directly in the browser development tool (F12). Any changes tested should however still be applied to the CSS sheet on file!


#### Photo blog

Note that hosting pictures on GitHub is not efficient. Selling photos on the blog creates unnecessary overhead. The solution is to offload the photography on a platform that is meant to share and sell photos (e.g. "500px").
Jekyll blogs are useful for making a photography portfolio (although slightly more complex than Wordpress).

Based on the Project Specification (containing scope, scale, To do's and tools) and a sketch/prototype, theme "DopeTrope" was selected for this site.

    "The the essence of the freemium model: You attract readers to your blog with free content and embed your own pictures at the end of the post. The readers are eventually converted into paid
    users of that photography."
    
    

##### Adapting the DopeTrope theme to a photo blog

1.  Change the main title. Start looking in `index.html`; there is an include `header_landing.html` that sets an `h1` header with the blog title: change this title.
2.  `header_landing.html` further defines a navigation bar for `index.html`. Note that the `nav.html` include file also contains a navigation element intended for other page layouts (e.g. `left-sidebar.html`). Shorten the navigation bar to only include "Home", "Blog", "Specialties" and "Subscribe" elements.
3.  The next part of the header is the banner which gives an impression of the portfolio; change the text as appropriate
4.  The "features" `section` (id "intro") in the next part of the header needs to be moved to a separate page where it can be shown without accompanying blog and footer; create a layout that does not include blog and footer but does include specifically the `header_landing` include file with its "features" section. Create a new page ("Features") that uses this new layout. Remove the "Features" from `index.html` by creating a new version of the `header_landing` include file that excludes the "Features"
5.  Create a new page listing the blog posts using existing code in `no-sidebar.html`
6.  Remove the blog from the `landing.html` template while adding two closing `div` tags to `index.html` (which used to be taken care of in the `blog.html` include)
7.  Modify the blog post page (`posts.html`): modify `nav.html` to make it similar to the navigation in `header_landing`
8.  Modify the posts in the `_posts` folder: remove the image link in the YAML header and add category `pinned` to each of them; in the `footer.html` only show posts with category `pinned`: `{% for post in site.categories.pinned offset: 0 limit: 3 %}`
9.  Embedding images from a photography site requires constraining the size of the images: use `http://embed.ly/code`
10. Add links to blog posts and features to the navigation block in the `header_landing_new.html`, `nav.html` and `header_landing_new.html` codes
11. Add the sign-up form link (generated in MailChimp) to the subscribe button on the navigation bar.

The modular implementation of these Jekyll blogs makes them very customizable. On the other hand, it is not directly evident how include files, layouts and top-level pages are interlinked.

Professional photos hosted on a regular web site take too long to load. Instead of hosting them on dedicated sites like "500px" they can be served using a **Content Delivery Network** (CDN).
A CDN serves static content to users with high performance. The content is requested at the same time as the web page is loaded. CDNs resolve to an optimized server based on location of the user and availability of the server.
Most portfolios rely on some kind of CDN. CDNs also offer SSL encryption and DDOS protection.


#### Debate platform

Along the lines of an Oxford-style debate:
*   two speakers, a moderator, participants
*   one speaker defends a proposition, the other opposes it

The inspiration comes from the "Debates" pages in "The Economist" (which is a closed platform unlike the Jekyll platform in this chapter, which is open source).

##### GitHub walk-through

**Pull requests** are the only proper way to contribute to open source projects in GitHub. Pull requests are issued after forking and adding to a repository. The commits to be submitted should be described clearly.
**GitHub pages** is an automatic page generator that, for existing projects, uses branch `gh-pages`. This feature can be used to create a landing page for a repo.
When repo `username.github.io` is selected, GitHub pages automatically converts that repository into a website and includes any Jekyll content in the compilation process. 

> A custom domain can be supplied for a web site created with GitHub Pages. GitHub will redirect to this custom domain.

Two types of redirect exist: subdomains and apex domains. 

Terminology:

1.  subdomains, e.g. `subdomain.example.com`
2.  primary domains (top-level domains), e.g. `example.com`
3.  project directory, e.g. `example.com/project`
4.  apex domains (top-level domains so called by GitHub to refer to redirects), 

*   Organization pages are redirected to apex domains: a `CNAME` file in the GitHub repo and the "zone" file of the custom domain are involved in making the redirect happen.
    *   Create a `CNAME` file in the GitHub repository containing the top-level domain name of the domain to redirect to.
    *   Create "A" records in the DNS Zone file to resolve to the following IP addresses: `192.30.252.153` and `192.30.252.154` (`https://help.github.com/articles/setting-up-an-apex-domain/#configuring-a-records-with-your-dns-provider`) 
*   Project pages are redirected either to a subdomain or to an independent domain. If an organization site exists, projects default to being subdomains of the organization site
*   To make a project redirect to an independent domain:
    *   On the repository side, create a `CNAME` file with the domain name
    *   On the DNS side, create a `CNAME` record (with name, type and value: `blog`, `CNAME` and `username.github.io.`) and an `A` record ([blank], `A` and `192.30.252.153`)
*   To make a project redirect to a subdomain: 
    *   On the repository side, create a `CNAME` file with the subdomain name
    *   On the DNS side, create a `CNAME` record (`blog`, `CNAME` and `username.github.io.`)


### Jekyll and R code

Section 13.4 (p165) in the book "Dynamic documents with R and knitr, Second Edition" by Yihui Xie explains how to render R input and output for use in Jekyll.








