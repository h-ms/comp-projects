
# Codecademy HTML and CSS

[This Codecademy course unit](https://www.codecademy.com/learn/web) teaches the basics of HTML and CSS. Including projects,
this course contains 7 units.


## Unit 1. Introduction to HTML

HTML

:   Hypertext Markup Language. Hypertext is text with links in it. HTML gives websites structure.


Expected structure of a HTML page:

    <!DOCTYPE html>
    <html>
    ...
    </html>
    
In between the `html` tags, usually a `head` and a `body` part appear.
The head contains information about the HTML file, such as the file's `title`.
The body part contains page content, often as headings `h1`, `h2`, `h3`, ... or in paragraphs `p`.

Link tags (`a`) carry an `href` attribute giving the web address for the hyperlink. The clickable text for the 
hyperlink appears between the opening and closing tags.

Image tags (`img`) carry a `src` attribute giving the URL for the image to display. The image tag has no closing tag, but ends with `/>`.

Link and image tags can be combined, adding a clickable image to a hyperlink instead of clickable text.


## Unit 2. HTML structure: using lists

Ordered lists (`ol`) are body elements that contain numbered list items (`li`).
Unordered lists (`ul`) are body elements that contain list items (`li`) that start with bullet points.
Lists can be nested, meaning a new list is a child of a list **item**!
From the (W3 wiki)[https://www.w3.org/wiki/HTML_lists#Nesting_lists]: "The key to nesting lists is to remember that the nested list should relate to one specific list item. To reflect that in the code, the nested list is contained inside that list item."


### Inline styling examples

-   comments appear in between `<!-- -->` notation
-   the `style` attribute in an opening tag allows adding inline styling to headings, paragraphs and links. The specification of the style is given in quotes `style="font-size: 12px; color: red; font-family: Arial; background-color: grey; text-align: center"`
-   the `strong` tag by default makes enclosed text appear in bold face
-   the `em` tag by default italicizes enclosed text


## Unit 3. HTML structure: tables, divs and spans

### Tables

Just like the `html` element is subdivided into `head` and `body`, a `table` element can be specified in terms of a table head (`thead`) and a table body (`tbody`).
The `tbody` encloses a nested structure of table rows `tr` and table data `td`.
More columns are added by adding additional `td` tags inside a table row.
Similarly, the `thead` encloses a nested structure of table rows `tr` and table headings `th`. The `th` tag takes attribute `colspan="x"`, with `x` the number of columns to span over.
Both `th` and `td` tags take `style` attributes, some of which are specific to tables.

### Div and span

The `div` (division) tag divides the page into containers: these are particularly useful when combined with CSS.
`div` containers have attributes like `width` and `height` that set their dimensions. Width can be in `px` but also, for example, in `%`.

`span` elements allow you to style smaller parts of the page, such as text.


## Unit 4. Introduction to CSS

CSS

:   cascading style sheets: a language that describes the appearance and formatting of HTML

style sheet

:   a file that describes how an HTML file should look

cascading

:   the ability to add formatting when more than one style applies


Style code that is not inline can either appear:

-   in the `style` element of an HTML file's `head`
-   in a separate CSS file. In this case, add a `link` (self-closing) tag in the HTML page's `head`. The `link` has attributes 
    -   `type`, which should be set to `"text/css"`,
    -   `rel`, which should be set to `"stylesheet"`,
    -   `href`, which should contain the name of the CSS file.
    The separator between attributes consists of one or more blanks


Random facts about CSS:

-   CSS comments are placed in between `/*   */`.

-   Font size `em` is equal to the default font size the user is using.

-   Three built-in fonts in CSS are `serif`, `sans-serif` and `cursive`. These can be placed as alternative fonts or backup values (that will always work) after some other fonts which the computer may not know. Use comma as separator.

-   The `border` property is useful in e.g. tables, figures. Many items, including data entries (`td`), can also be modified using properties such as `height`, given in pixels.

-   Links have a `text-decoration` property, which can be set to `none`.


## Unit 5: CSS classes and ids

-   An HTML document can be thought of as a tree.
-   In terms of terminology, an element is a child of **every** element wrapped around it, even if that element is several "branches" away.
-   Certain selectors will "override" others if they have a greater *specificity* value

Specifying selectors:

1.  elements can be differentiated by the level of nesting: e.g. `div div div h3`
2.  the `*` selector selects every element on the HTML page; using this in combination with the `border` property visualizes the **"HTML/CSS box model"**
3.  specify a direct child using `>`, e.g. `div > p`
4.  classes and ids are more specific than element-based selectors
    -   classes are identified in CSS with a dot, e.g. `.square`
    -   classes are identified in HTML with the attribute `class`, e.g. `class="square"`
    -   ids are used when there is a specific element (rather than a class of elements) that should be formatted in a particular way
    -   ids are identified in CSS with a pound (hash) sign, e.g. `#square`
    -   ids are identified in HTML with the attribute `id`, e.g. `id="square"`
5.  pseudo-class selectors allow accessing items that are not part of the HTML tree (example: links that have been clicked on). They are represented in CSS by `:`.
    -   `a:link` refers to an unvisited link,
    -   `a:visited` refers to a visited link,
    -   `a:hover` refers to a link that is hovered over
    -   `p:first-child` refers to paragraphs that are the first child **(of any kind: paragraph, heading, ...)** of their parent elements
    -   `p:nth-child(n)` refers to paragraphs that are the nth child **(of any kind: paragraph, heading, ...)** of their parent elements
    

## Unit 6: CSS positioning

Controlling the position of HTML elements allows you incredibly fine control over how your pages look.
The CSS box model refers to the fact that each HTML element is a box that holds contents.

-   By default, elements take up the full width of the page (they therefore sit on top of each other)
-   The `display` property affect horizontal outlining of elements; values are
    1.  `block`: box takes up full width
    2.  `inline-block`: box accepts neighbours; if there are none, it takes up full width
    3.  `inline`: box only takes up as much space as it needs for its contents
    4.  `none`: box is not displayed

-   A box has multiple layers. From outermost to innermost, these are
    1.  `margin`: empty space around the HTML element
    2.  `border`: edge of the HTML element that can be visualized using the `border` property
    3.  `padding`: space between element contents and the border edge
    4.  `content`: the actual stuff in the box
    
    Each of margin, border and padding can be specified in terms of
    *   top
    *   right
    *   left
    *   bottom
    
Adjusting our margins not only moves our element relative to other elements on the page, but also relative to the "walls" of the HTML document.

-   `margin: auto;` centers a box on its line
-   `margin-top: 10px;` sets the margin at one side
-   `margin: 10px 20px 10px 20px;` sets all margin sides
-   padding is set in the similar way as margin: either at one side or all. `padding: 10px;` uses the same padding width on all four sides.

Just like increasing a margin will move the box further away from its neighbours, decreasing a margin will bring it closer (to the point of even overlapping its neighbours in case of negative margins).

**Floating** elements puts them into the flow of other elements without elements landing on top of each other.
The CSS `float` property gives the direction in which an element should float on the page.

Floating and non-floating elements can end up on top of each other. Use `clear: both` to place non-floating elements below elements that may be floating to its left or right.

**Static** elements (default positioning) do not position themselves in any particular way relative to other elements.

**Absolute** elements are positioned relative to the first non-static parent (or `html`if there is none). Absolute positioning is set using `position: absolute;`.

**Relative** elements are positioned relative to where they would have landed if they were `static`. Set using `position: relative`.

**Fixed** elements are positioned relative to the browser display area (meaning they appear stuck to the screen and do not react to scrolling).
    

