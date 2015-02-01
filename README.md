"Footnotes" is a [Jekyll](http://jekyllrb.com/) plugin that helps inserts
footnote reference and body HTML, with automatic numbering, if desired.

All footnotes will include a superscript link to the footnotes body. The
footnote body will include a link back to the footnote (using the ⏎ icon ) for
easy reading.

## Install

* Include "jekyll-footnotes" in your Gemfile, or install the gem
* Add "jekyll-footnotes to the plugins section of \_config.yml

## Automatic numbering
    hello{% fn %} world{% fn %}
    {% footnotes %}
       {% fnbody %}
          <p>salut</p>
       {% endfnbody %}
       {% fnbody %}
          <em>monde</em>
       {% endfnbody %}
    {% endfootnotes %}

## Custom numbering:
    hello{% fn 3 %} world{% fn 5 %}
    {% footnotes %}
       {% fnbody 3 %}
          <p>salut</p>
       {% endfnbody %}
       {% fnbody 5 %}
          <em>monde</em>
       {% endfnbody %}
    {% endfootnotes %}

## CSS Styling
The following CSS selectors allow the footnotes, footnote bodies, and backlinks
to be customised using CSS

```CSS
.footnote {
  /* a single footnote link */
}
.footnotelist {
  /* entire footnote section */
}

.footnotelist .footnotebody {
  /* a single footnote body  */
}

.footnotelist .backlink {
  /* backlink to the footnote link */
}
```

Do not mix custom and automatic numbering (although it will work if you only
use custom numbers above the highest automatic one).

Only numeric IDs are allowed currently.

**We generate valid HTML5**


© Ben Eills, 2013
© Julian Simioni, 2015

Released under the MIT License
