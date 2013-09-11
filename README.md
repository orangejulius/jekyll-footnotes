"Footnotes" is a [Jekyll](http://jekyllrb.com/) plugin that helps inserts footnote reference and body HTML, with automatic numbering, if desired.

### Install

    cd /root/of/site
    mkdir -p _plugins
    wget -O _plugins/footnote.rb "https://raw.github.com/beneills/jekyll-footnotes/master/footnotes.rb"


### Automatic numbering:

    hello{% fn %} world{% fn %}
    {% footnotes %}
       {% fnbody %}
          <p>salut</p>
       {% endfnbody %}
       {% fnbody %}
          <em>monde</em>
       {% endfnbody %}
    {% endfootnotes %}
### Custom numbering:

    hello{% fn 3 %} world{% fn 5 %}
    {% footnotes %}
       {% fnbody 3 %}
          <p>salut</p>
       {% endfnbody %}
       {% fnbody 5 %}
          <em>monde</em>
       {% endfnbody %}
    {% endfootnotes %}

Do not mix custom and automatic numbering (although it will work if you only use custom numbers above the highest automatic one).

Only numeric IDs are allowed currently.  Other IDs will work if you modify the HTML snippets below to remove <ol>

**We generate valid HTML5**


Ben Eills, 2013
