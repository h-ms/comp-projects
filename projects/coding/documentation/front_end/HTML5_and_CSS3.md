# Dash - HTML5 and CSS3

[This page](https://dash.generalassemb.ly) teaches the basics of HTML5 and CSS3. Complete the first three projects.


## Part 1. HTML basics

*   Form inputs are created using the `<input>` tag
    *   attributes include `email` and `submit` (for email field and submit button)
    *   the `email` attribute can be joined by a `placeholder` attribute
    *   avoid some of the styling defaults by setting `border: 0` for the `input` selector in CSS and then add further style elements manually
    *   style the `input` selector by one of its attributes by using `input[type="submit"]`

*   Add a background image in CSS by using `background: url("");`
    *   avoid the background image from appearing "tiled" by using `background-size: cover;` (if it is not important that all of the image is visible at all times this is more mobile-friendly than using 100%).
    *   also set `background-position: center;`


## Part 2. Build a responsive blog theme

*   The `header` tag is nested within the `body` tag
    *   navigation menus may be added in the `header` using an unordered list `ul`
       *   when centering such lists they appear not aligned: to resolve this, add padding in all directions, `padding: 10px;`
       *   in navigation menus, list items are placed next to each other: `display: inline;` (instead of block format),
       *   subsequently add left and right padding to separate navigation items further

*   `"normalize.css"` is a style sheet that makes browsers render elements in line with modern standards

*   Make round border (e.g. around images) by using the `border-radius` setting

*   The `<article>` tag groups text elements that belong together content-wise

*   Move content to center-page by using `margin: 0 auto;` meaning 0 margin at top and bottom and auto-margin left and right (adds as much margin as is available to both sides).

*   Making content responsive to various screens and devices:
    1. use `max-width` instead of `width` to allow auto-wrapping of text when the screen size is narrower than a given width
    2. add CSS code conditional on screen width using **media queries**
      *   Add applicable CSS declarations inside `@media (max-width: 500px) { }`
      *   Add media queries at the end of the style sheet to make sure no later elements can override these conditional styles
      
*   Hex color codes specify redness, greenness and blueness, each from 0 to F. `#f00` is a valid hex code
    * color function `rgba()` throws opacity into the argument list (in 4th position with value between 0 and 1). The first three arguments are RGB each with values between 0 and 255
    * use attribute `opacity` to set just the opacity  

*   Add buttons with text using the `<button>text</button>` construct

*   Add javascript to add actions to buttons: use the `<script></script>` construct and place it just before the closing `body` tag. 
    *   The simplest javascript action is the "alert" action: `<script>alert("Javascript works!");</script>` 
    *   Associate javascript actions with button "events" (such as clicks) using e.g. jquery code: `$(button).on("click", function() { alert("Clicked!") });`. Javascript "listens" for button events.


## Part 3. Build a small business website


*   `div` is a multi-purpose element that groups elements to allow the same CSS can be applied to them. In contrast to `article` or `header`, `div` is non-semantic.
*   `div` tags are used in combination with `class` attributes that name and group the `div` blocks.
*   `div` in combination with `class` allows the overarching style to be specified for `div` and class-specific style for each of the classes.
*   Styles flow down in order of specificity: `class` style takes priority over `div` style.
*   If the style for a particular element is not specified, the style of a higher-level element will be applied.

*   CSS `line-height` sets the vertical space between lines in a paragraph
*   `text-align: justify;` makes all lines of equal width

*   position paragraph text inside a `div` relative to that `div` by setting `position: relative;` for the `div` and `position: absolute;` for the `p`. 

*   line breaks are self-closing tags: `<br />`
*   semantic tag `small` can be used to indicate that specific text should be printed smaller.
    
*   `span` elements are __inline__ elements used to give part of the parent element (such as `p`) a different style. 
*   The fact that `span` is inline means it cannot use style element `text-align` (which works on blocks only).
*   Other inline elements are `img`, `a` and `input`.
*   Style element `float` allows inline elements to be aligned relative to their containers.

*   Currently (2016) background gradients only work when specified in combination with vendor prefixes (`background: -webkit-linear-gradient(...);`). Keep however a line without the prefixes, in case they are discontinued. In IE, gradients are not supported. Therefore, add a line with (solid) `background-color` in first position, followed by lines for browsers that do support background gradients.

*   Non-default fonts can be found on [Google Web Fonts](http://google.com/fonts)
*   Select a font and copy the HTML and CSS code in the "Embed" submenu into your HTML (in `head`, above the CSS link or block) and CSS files

*   Universal (default) `div` style has a margin of 40px above and none at other sides. 


### jQuery

*   Include jQuery source in the `head`: e.g. `<script scr="/assets/jquery.js"></script>`

*   jQuery can be used to add interactive behavior:
    *   Example: clicking on an HTML element toggles a CSS class which modifies styles. The JS action here would be `$(this).toggleClass('show-description');`
    *   JS variable `$(this)` refers to the HTML element that the JS function was called on (e.g. the one that was clicked if the event listener is `.on('click', ...)`)

*   CSS3 feature `transition` can be added to make interactive JS behavior visually more appearing, e.g. by adding a sliding e: `-webkit-transition: height .5s;` where `height` belongs to an element whose style can be toggled by clicking on it


    
    