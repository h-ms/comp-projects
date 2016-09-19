
# Code Guide by @mdo
## Standards for developing flexible, durable, and sustainable HTML and CSS

[This web page](http://codeguide.co/) provides style conventions for HTML and CSS.
This summary lists the most important points to remember.

General idea behind style guides: "Every line of code should appear to be written by a single person, no matter the number of contributors."


## HTML

1.  Indent nested elements once with two spaces (soft tab)
2.  Use double quotes on attribute values
3.  Use the `lang` attribute in the opening `html` tag
4.  Specify character encoding in a `<meta>` tag; e.g. `charset="UTF8"`. Once specified, you no longer need to use character entities in HTML (e.g. `&raquo;`).
5.  Order of the common attributes:
    1.  `class`
    2.  `id`
    3.  `src`, `type`, `href`, `value`
    4. `alt`
6.  Avoid superfluous parent elements (e.g. `span`)
7.  Do not write markup in Javascript files


## CSS

1.  Whenever you group selectors in a single CSS statement, write each on a separate line
2.  Use one space before the opening brace of a declaration block
3.  Place the closing brace on a new line
4.  Use a space after the colon `: `
5.  Give each declaration its own line and always end with semi-colon
6.  Do not use spaces between the arguments of values such as `rgb()`
7.  Do *not* add leading zeros in property values
8.  Lower-case all hexadecimal values
9.  Do not specify units for zero values: `0` and not `0px`
10. Group declarations for a given selector as follows:
    1.  Positioning
    2.  Box model
    3.  Typographic
    4.  Visual
11. Place media queries as close to their relevant rule sets whenever possible. 
12. Do not use short-hand notation when only a single value needs to be set: `margin-bottom: 10px;` instead of `margin: 0 0 10px;`
13. Comments: great code comments convey context or purpose
14. Class names: use dashes as separator in prefix-clases
15. Selectors:
    1.  Use classes over generic element tag for optimum rendering performance
    2.  Avoid using several attribute selectors on commonly occurring components
16. Organize sections of code by component
















