
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
2. cleaning it out (`git rm -rf .`, `sudo git clean -dfx`),
3. after removing any existing `upstream` url, add the theme repo as an `upstream` remote (`git remote add upstream <url>` i.e., unlike the "origin" remote, you only pull from it, never push to it)
4. `git fetch upstream` (updates the remote-tracking branch),
5. `git pull upstream master`
6. Check out the `Gem` files from the master branch, then build the theme locally and test it (`sudo bundle exec jekyll serve`); 
7. Copy across blog posts from the master branch: `git checkout master -- _posts` (and perhaps `_drafts` as well). 
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


Objectives of prototyping

*   Help visualize the end product. The prototype guides the search for an editable theme ("you almost never want to start from absolutely nothing").
*   Model the site's behaviour and workflows using a storyboard: capture transitions going from one step (page) to the next.


The purpose of **Jekyll Collections** is to facilitate

*   organizing topics/debates/posts 
*   automatically updating/reassigning links when a new topic/debate/post is added (so called "routing", which is the topic of advanced frameworks like "Ember.js" and "Angular.js")


Jekyll routing mechanisms involve:

*   primitive-type routing preset, which creates links at compilation
*   derived-type routing relying on YAML (permalink) and Liquid (inheritance, includes)
*   "collections": sets of interrelated documents with custom properties that behave like a post or page

Collections are created by

*   adding a new folder with the name of the collection (`_collection`)
*   specify the folder in `_config.yml` along with optional variables. Example:

~~~
collections:
         new_debate:
           output: true               # every page in the collection is an html file
           permalink: /new_debate/:path/ # routing and permalink for each page
~~~

In this example, every debate represents a new collection, accessible via e.g. `/new_debate/index.html`.


##### Editing the Debate theme

*   Modify navigation: make two bars (one to navigate to the debates, another to navigate within each debate).
    To create the second bar, a global variable is required that can be set to the debate that is the "current" debate.
    It is further assumed that each debate in the collection has the same set of pages (debate phases)
*   Show the current debate
*   List previous debates by looping over the debates (collections) and displaying links for all of them
*   Make the header image appear with the appropriate text

The heavy use of third-party clienttools in Jekyll blogs is related to the fact that no server-side programming can be done
as Jekyll creates static pages.
    


#### Open research

##### Planning

Functionality to be embedded in the theme:

1.  KaTeX, a minimal LaTeX distribution (using source files)
2.  Plotlyjs, a graph drawing tool (using a CDN file)
3.  Bibliography (bibtex), parsed by Javascript
4.  An Ipython notebook, displayed on the blog and in `nbviewer`
5.  `Reveal.js`, a slide tool: download files to submodule (a Git repository inside the Jekyll blog Git repository), add settings as YAML front matter.

Any tool that is embedded into the theme needs to be instantiated, typically using a `div` tag.


##### Implementation

*   Install the files for Jekyll theme ["clean blog"](http://jekyllthemes.org/themes/clean-blog/).
*   Load and instantiate `KaTeX`:
    *   Copy files `katex.min.css` and `katex.min.js` from https://github.com/khan/katex/releases to new Jekyll folder `public`
    *   Load the files in `head.html` (in `_includes`) using `link` and `script` tags, respectively
    *   Instantiate by adding javascript code that tells all blog posts to render `KaTeX` code properly:
        JS code is added to a module `render_katex.html` in the `_includes` folder which is then called by the post layout file (at the start of `{{ content }}`.
*   Test by adding an equation to one of the posts. Add Liquid escape "character" `{% raw %}` and `{% endraw %}` around the `div` element that includes
    the equation (given by attribute `data-expr`).
*   Load and instantiate `Plotly.js`
    *   Add a link to the Plotly application in `head.html`
    *   In a blog post, add a canvas (a `div` block with pre-specified dimensions)
    *   Add JS code for a Plotly graph and link it to the canvas.
*   Parse a bibliography (bibtex to HTML) and render it (styling it using CSS) on a separate blog **page**:
    *   load `jquery`,
    *   load `bibtex_js.js`
    *   load the bibtex bibliography (use a liquid `include` tag to load the file as a module),
    *   render the bibliography in a dedicated `div` box; also add a separate `div` box containing an HTML template.
    Note: the `bibtex_js.js` file does not render the bibliography correctly in the Chrome browser.
    Note: the correct JS file makes sure `jquery` is loaded on every page used by `bibtex_js`. A usable version of the JS file is added to this code documentation Git repository. 
    Data can also be saved in YAML formatted files in the `_data` folder: entries in the YAML file can be programmatically accessed using the Liquid variable  `site.data.projects`,
    with `projects` referring to the base name of the YAML file. For bibtex information, this is not efficient as it takes a lot of work to parse and render each
    bibtex entry. A plug-in (`jekyll-scholar`) designed entirely for bibliographic purposes will be the best option to display a bibliography.
*   iPython notebooks (`ipynb` files) render directly on GitHub (they are translated to markdown): read [here](http://blog.jupyter.org/2015/05/07/rendering-notebooks-on-github/)..
    Further reading [here](http://www.nature.com/news/interactivenotebooks-sharing-the-code-1.16261). 
    No code demo is presented in the book.
*   Add `reveal.js` to the project as a Git sub-module: `git submodule add https://github.com/hakimel/reveal.js.git`, then, create a layout that achieves the following:
    *   import the `reveal.js` files to the right place
    *   supply `reveal.js` with configuration details
    Then, create a blog post and put `slide` in the YAML layout. The output is a slide show.
    
    

#### Open Jekyll (last chapter)

This chapter covers the concepts of:

*   plug-ins (including Jekyll compilation to include plug-ins), 
*   Ruby, 
*   Continuous Integration,
*   secure keys, 
*   automating the build process,

Integration of technologies into Jekyll may occur on two levels:

*   overlay assets layer (overlaid on an existing Jekyll skeleton): integrations into this layer are achieved with Liquid's `include` mechanism and are compatible with GitHub.
*   shared features layer (core Jekyll funcitonality, not covered in previous chapters)

GitHub will not build Jekyll blogs that use custom plug-ins: due to security concerns, GitHub uses the `--safe` Jekyll build flag. As a work-around,
build the blog locally and push the static files (in the `_site` folder) to GitHub.


##### Project: "Jekyll Design Studio"

This chapter's project consists of a web site that is a blog design studio (it builds and sells custom Jekyll implementations). Features include:

1.  a parallel advertising platform (Fiverr)
2.  a shopping cart (Snipcart)
3.  pre-order and subscription functionalities (Gumroad)
4.  video ads (Youtube, Wistia)
5.  donations (Youtube)
6.  mock-ups and demos (InVision)
7.  add live embeds of demos (embed.ly) 
8.  live customer support (Hipchat)
9.  password-protected web products (Aerobatic)
10.  create custom Jekyll plug-ins
11.  automate compilation of custom Jekyll builds
12.  continuous integration: compile the design studio every time a change is made to ensure all plug-ins are always integrated (Codeship).
     Automatic rebuilds are created by "build tools" which use specific files supporting the build process. The resulting rebuilt site is placed
     back in the same location as the original.

##### Ruby

Ruby is dynamically typed (user does not need to specify the object's type) and object-oriented.
Ruby on Rails is the backbone of GitHub.
The online interpreter software used in this chapter to learn and play around with Ruby is `repl.it`.
Note: Ruby and Liquid syntaxes are very different.

**Basics**

*   primitive data types are integer, boolean and string
*   function `puts` works like `print` but adds a newline to the output
*   reading in a string from standard input and assigning to variable: `phrase = gets.chomp`
*   string concatenation: `"this is" + my_text_var`

*   everything is an object: properties and methods of objects are accessed by adding their names after the object, separated by "`.`"
*   methods operating on an object can be concatenated ("chaining")
*   an exclamation mark after a method indicates the method will change the object it was called on

*   `if` statements can be followed by `else if`, `else` and always end with `end`. Statements following the condition are indented.
*   short-hand conditional evaluation is achieved using `.includes?` followed by (optionally `else` and) `end`
*   `unless` works similarly to `if`, with opposite meaning
*   `until` loops are the opposite to `while` loops: both end with `end`
*   the condition in `for` loops may include `..` which includes the higher number, or `...` which excludes the higher number: e.g. `for i in 1...10` excludes 10.
    Break out of a loop using `break if` (which uses no separate `end`)

*   arrays are lists of items (index starts with 0): `[12, "ash", 24, 2]`
*   the array index often is a counter in loops
*   a `do` loop (similar to a `for` loop) specifies a counter variable in between `| |`:
~~~
        my_array.each do |item|
            puts item
        end
~~~
*   hashes are arrays that can be indexed by any type of object (not only integers); they are lists of key-value pairs separated by `=>` or `:` and surrounded by curly braces:
~~~
        my_hash = {
            key1 => value1,
            key2 => value2
            }
~~~
    The `do` loop now functions as follows:
~~~
        my_hash.each do |key, value|
            puts key + ": " + value
        end
~~~
*   add a new element to a hash: `my_hash[key3] = value3`
*   the `select` method works on hashes as follows, e.g.: `.select { |name, rating| rating > 2 }`, where `name` represents the key and `rating` the value

**Methods and classes**

*   a function definition consists of a header, body and ending
*   a function can be defined with an undefined number fo arguments through the use of "splat" arguments:
~~~
        def what_up(greeting, *bros)
          bros.each do |bro|
            puts "#{greeting}, #{bro}!"
          end
        end
~~~
*   the use of `#{}` indicates a placeholder for the string argument to be passed
*   a method can return a boolean which can then be used in further calculations, e.g.: `return true`
*   Jekyll plug-ins contain numerous methods that work together to provide functionality
*   Creating a class using the `initialize` method (the "constructor"), as well as adding methods for the class:
~~~
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
  def about
    puts "I'm #{@name} and I'm #{@age} years old"
  end
  def account
    @number = 12345
    puts "My bank account number is #{@number}"
  end
end
~~~
*   Constructing a new object of class `Person`: `Jim = Person.new("Jim", 20)`: `new` looks for a method `initialize` to construct an object of class `Person`. Class names by convention start with a capital letter
*   The line of code above illustrates "declaration" of a new variable (`Jim`), "instantiation" of a new object of a certain class (`Person.new`) and "initialization" of properties of the object
*   `@variable` represents an instance variable, which is available everywhere in the class


##### Ruby Gems

A gem is a library of classes that together provide a well-described piece of functionality. Jekyll is an example of a gem.
Libraries are distributed using packages. Ruby's package manager is RubyGems. Command-line access to RubyGems is provided using the `gem` command.
Object `ri` is the Ruby index, which is Ruby's help documentation.
The library can be called from the command line, outside of `ruby`, just by calling its name.

Just like a javascript file can be made a dependency for a Jekyll project, other gems can be dependencies too.
A Ruby **Gemfile** defines the dependencies required by a project.

Jekyll itself requires a number of dependencies to work. When Jekyll is installed, these are installed at the same time using information in the Gemfile.
Create a Jekyll blog project from scratch in folder `myblog`:

*   `jekyll new myblog` where `myblog` may be the current folder




#### Git command line

A review of Git command line functions is given.




### Jekyll and R code

Section 13.4 (p165) in the book "Dynamic documents with R and knitr, Second Edition" by Yihui Xie explains how to render R input and output for use in Jekyll.








