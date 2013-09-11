module Jekyll

  # "Footnotes" helps inserts footnote reference and body HTML, with
  # automatic numbering, if desired.
  #
  # == Automatic numbering:
  #    hello{% fn %} world{% fn %}
  #    {% footnotes %}
  #       {% fnbody %}
  #          <p>salut</p>
  #       {% endfnbody %}
  #       {% fnbody %}
  #          <em>monde</em>
  #       {% endfnbody %}
  #    {% endfootnotes %}
  #
  # == Custom numbering:
  #    hello{% fn 3 %} world{% fn 5 %}
  #    {% footnotes %}
  #       {% fnbody 3 %}
  #          <p>salut</p>
  #       {% endfnbody %}
  #       {% fnbody 5 %}
  #          <em>monde</em>
  #       {% endfnbody %}
  #    {% endfootnotes %}
  #
  # Do not mix custom and automatic numbering (although it will work
  # if you only use custom numbers above the highest automatic one).
  #
  # Only numeric IDs are allowed currently.  Other IDs will work if
  # you modify the HTML snippets below to remove <ol>
  #
  # We generate valid HTML5
  #
  class FootnoteTag < Liquid::Tag
    def initialize(tag_name, id, tokens)
      raise(SyntaxError.new("invalid footnote ID")) if ['"', '<', '>'].any? { |c| id.include?(c) }
      @id = id.strip unless id.strip.empty?
      super
    end

    def render(context)
      if @id.nil?
        context.registers[:fn] ||= 0
        context.registers[:fn] = context.registers[:fn].next
        @id = context.registers[:fn]
      end
      "<sup><a href=\"#fn:#{@id}\" class=\"footnote\" rel=\"footnote\">#{@id}</a></sup>"      
    end
  end
  
  
  class FootnoteBody < Liquid::Block
    def initialize(tag_name, id, tokens)
      raise(SyntaxError.new("invalid footnote ID")) if ['"', '<', '>'].any? { |c| id.include?(c) }
      @id = id.strip unless id.strip.empty?
      super
    end

    def render(context)
      if @id.nil?
        context.registers[:fnbody] ||= 0
        context.registers[:fnbody] = context.registers[:fnbody].next
        @id = context.registers[:fnbody]
      end
      context.stack do
        body = super
        "<li id=\"fn:#{@id}\" class=\"footnotebody\"value=\"#{@id}\">#{body}</li>"
      end
    end
  end

  class FootnoteList < Liquid::Block
    def render(context)
      context.stack do
        body = super
        "<ol class=\"footnotelist\">#{body}</ol>"
      end
    end
  end

  Liquid::Template.register_tag('fn', Jekyll::FootnoteTag)
  Liquid::Template.register_tag('footnotes', FootnoteList)
  Liquid::Template.register_tag('fnbody', FootnoteBody)
end
